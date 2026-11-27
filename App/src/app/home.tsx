import React, { useState, useEffect, useMemo, useRef, type ComponentRef } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { Image } from 'expo-image';
import { useLocalSearchParams, useRouter } from 'expo-router';
import api, { mensagemDeErro } from './api';

interface Bicho {
  id_insetos: number;
  nome_insetos: string;
  nc_insetos: string;
  ordem_insetos: string;
  familia_insetos: string;
  dieta_insetos: string;
  destaque: number | boolean;
  curiosidade: string;
  foto_insetos: string;
}

const ORDENS_PADRAO = [
  'Insetos',
  'Aracnídeos',
  'Crustáceos',
  'Moluscos',
  'Cnidário',
  'Equinodermo',
];

const DIETAS_RAPIDAS = [
  'Carnívoro',
  'Herbívoro',
  'Detritívoro',
  'Onívoro',
  'Filtrador',
];

const BICHOS_FALLBACK_LOCAL: Bicho[] = [
  {
    id_insetos: 1,
    nome_insetos: 'Borboleta-monarca',
    nc_insetos: 'Danaus plexippus',
    ordem_insetos: 'Insetos',
    familia_insetos: 'Nymphalidae',
    dieta_insetos: 'Herbívoro',
    destaque: 1,
    curiosidade: 'Conhecida por suas longas migrações sazonais e cores de aviso.',
    foto_insetos: 'https://upload.wikimedia.org/wikipedia/commons/6/63/Monarch_In_May.jpg',
  },
  {
    id_insetos: 2,
    nome_insetos: 'Aranha-lobo',
    nc_insetos: 'Lycosa erythrognatha',
    ordem_insetos: 'Aracnídeos',
    familia_insetos: 'Lycosidae',
    dieta_insetos: 'Carnívoro',
    destaque: 1,
    curiosidade: 'Caça ativamente no solo e carrega os filhotes no dorso.',
    foto_insetos: 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Lycosa_tarantula.jpg',
  },
];

function capitalizarPrimeiraLetra(texto: string): string {
  const limpo = texto.trim();
  if (!limpo) return '';
  return limpo.charAt(0).toLocaleUpperCase('pt-BR') + limpo.slice(1);
}

function obterSaudacaoPorHorario(): string {
  const hora = new Date().getHours();
  if (hora >= 5 && hora < 12) return 'Bom dia';
  if (hora >= 12 && hora < 18) return 'Boa tarde';
  return 'Boa noite';
}

function formatarNomeUsuario(nomeParam?: string | string[], emailParam?: string | string[]): string {
  const rawNome = Array.isArray(nomeParam) ? nomeParam[0] : nomeParam;
  if (rawNome && rawNome.trim()) {
    return capitalizarPrimeiraLetra(rawNome);
  }

  const rawEmail = Array.isArray(emailParam) ? emailParam[0] : emailParam;
  if (rawEmail && rawEmail.includes('@')) {
    const prefixo = rawEmail.split('@')[0].replace(/[._-]+/g, ' ').trim();
    if (prefixo) {
      return capitalizarPrimeiraLetra(prefixo);
    }
  }

  return 'Usuário';
}

function normalizarOrdem(valor?: string): string {
  const limpo = (valor || 'Sem ordem').trim().replace(/\s+/g, ' ');
  if (!limpo) return 'Sem ordem';

  const chave = limpo.toLowerCase();
  const encontrada = ORDENS_PADRAO.find((item) => item.toLowerCase() === chave);
  if (encontrada) return encontrada;

  return limpo.charAt(0).toLocaleUpperCase('pt-BR') + limpo.slice(1);
}

function obterIndiceDiario(total: number): number {
  if (total <= 0) return 0;

  const agora = new Date();
  const chaveData = `${agora.getFullYear()}-${String(agora.getMonth() + 1).padStart(
    2,
    '0'
  )}-${String(agora.getDate()).padStart(2, '0')}`;

  let hash = 0;
  for (let i = 0; i < chaveData.length; i++) {
    hash = (hash * 31 + chaveData.charCodeAt(i)) >>> 0;
  }

  return hash % total;
}

export default function TelaHome() {
  const router = useRouter();
  const params = useLocalSearchParams<{ nome?: string; email?: string }>();
  const saudacao = useMemo(() => obterSaudacaoPorHorario(), []);
  const nomeUsuario = useMemo(
    () => formatarNomeUsuario(params.nome, params.email),
    [params.nome, params.email]
  );

  const [listaDeBichos, setListaDeBichos] = useState<Bicho[]>([]);
  const [carregando, setCarregando] = useState<boolean>(true);
  const [erroCarga, setErroCarga] = useState<string | null>(null);

  const scrollViewRef = useRef<ComponentRef<typeof ScrollView>>(null);

  useEffect(() => {
    let ativo = true;

    const carregarResumo = async () => {
      try {
        setCarregando(true);
        setErroCarga(null);

        const resposta = await api.get('conexao.php', {
          params: {
            all: 1,
            limit: 1000,
          },
        });

        if (!ativo) return;

        const dados: Bicho[] = Array.isArray(resposta.data?.dados)
          ? resposta.data.dados
          : Array.isArray(resposta.data)
          ? resposta.data
          : [];

        if (dados.length > 0) {
          setListaDeBichos(dados);
        } else {
          setListaDeBichos(BICHOS_FALLBACK_LOCAL);
        }
      } catch (erro: any) {
        if (!ativo) return;
        setListaDeBichos(BICHOS_FALLBACK_LOCAL);
        setErroCarga(mensagemDeErro(erro, 'Modo offline local ativo.'));
      } finally {
        if (ativo) setCarregando(false);
      }
    };

    carregarResumo();
    return () => {
      ativo = false;
    };
  }, []);

  const totalEspecies = listaDeBichos.length;

  const totalOrdensAtivas = useMemo(() => {
    const conjunto = new Set<string>();
    for (const bicho of listaDeBichos) {
      conjunto.add(normalizarOrdem(bicho.ordem_insetos));
    }
    return conjunto.size > 0 ? conjunto.size : ORDENS_PADRAO.length;
  }, [listaDeBichos]);

  const destaqueDoDia = useMemo<Bicho | null>(() => {
    if (listaDeBichos.length === 0) return null;
    const indice = obterIndiceDiario(listaDeBichos.length);
    return listaDeBichos[indice];
  }, [listaDeBichos]);

  return (
    <SafeAreaView style={styles.containerTela}>
      <StatusBar style="light" />

      <ScrollView
        ref={scrollViewRef}
        contentContainerStyle={styles.corpoScroll}
        showsVerticalScrollIndicator={false}
      >
        <View style={styles.headerRow}>
          <View style={styles.topoSaudacao}>
            <Text style={styles.textoSaudacao}>
              {saudacao}, {nomeUsuario}
            </Text>
            <Text style={styles.tituloApp}>Wiki de Invertebrados 🐛</Text>
          </View>

          <TouchableOpacity
            activeOpacity={0.75}
            onPress={() => router.push('/configuracoes' as any)}
            style={styles.botaoConfig}
            accessibilityLabel="Configurações"
          >
            <Text style={styles.iconeConfig}>⚙</Text>
          </TouchableOpacity>
        </View>

        {/* Sub-páginas principais em 2x1 */}
        <View style={styles.gradeSecoes}>
          <TouchableOpacity
            activeOpacity={0.84}
            onPress={() => router.push('/categorias' as any)}
            style={styles.cardSecao}
          >
            <View style={styles.topoCardSecao}>
              <View style={styles.pontoVerde} />
              <Text style={styles.setaCard}>›</Text>
            </View>
            <Text numberOfLines={1} style={styles.tituloCardSecao}>
              Categorias
            </Text>
            <Text numberOfLines={2} style={styles.descCardSecao}>
              Ordens e espécies registradas
            </Text>
          </TouchableOpacity>

          <TouchableOpacity
            activeOpacity={0.84}
            onPress={() => router.push('/habitats' as any)}
            style={styles.cardSecao}
          >
            <View style={styles.topoCardSecao}>
              <View style={styles.pontoVerde} />
              <Text style={styles.setaCard}>›</Text>
            </View>
            <Text numberOfLines={1} style={styles.tituloCardSecao}>
              Habitats
            </Text>
            <Text numberOfLines={2} style={styles.descCardSecao}>
              Biomas, climas e ambientes
            </Text>
          </TouchableOpacity>
        </View>

        {/* Métricas rápidas do acervo */}
        <View style={styles.metricasRow}>
          <View style={styles.metricaCard}>
            <Text style={styles.metricaValor}>
              {carregando && totalEspecies === 0 ? '...' : totalEspecies}
            </Text>
            <Text style={styles.metricaRotulo}>Espécies</Text>
          </View>

          <View style={styles.metricaCard}>
            <Text style={styles.metricaValor}>{totalOrdensAtivas}</Text>
            <Text style={styles.metricaRotulo}>Ordens</Text>
          </View>

          <TouchableOpacity
            activeOpacity={0.8}
            onPress={() => router.push('/favoritos' as any)}
            style={styles.metricaCardAtalho}
          >
            <Text style={styles.metricaAtalhoTexto}>Favoritos</Text>
            <Text style={styles.metricaAtalhoSub}>Salvos ›</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.secaoBloco}>
          <View style={styles.cabecalhoBloco}>
            <Text style={styles.tituloBloco}>Espécie em destaque</Text>
            <Text style={styles.rotuloDiario}>Dia atual</Text>
          </View>

          {carregando && !destaqueDoDia ? (
            <View style={styles.cardDestaqueVazio}>
              <ActivityIndicator size="small" color="#10B981" />
            </View>
          ) : destaqueDoDia ? (
            <TouchableOpacity
              activeOpacity={0.88}
              onPress={() =>
                router.push({
                  pathname: '/categorias' as any,
                  params: {
                    ordem: normalizarOrdem(destaqueDoDia.ordem_insetos),
                    busca: destaqueDoDia.nome_insetos,
                  },
                })
              }
              style={styles.cardDestaque}
            >
              <View style={styles.topoDestaque}>
                <Image
                  source={{
                    uri: destaqueDoDia.foto_insetos || 'https://via.placeholder.com/160',
                  }}
                  style={styles.fotoDestaque}
                  contentFit="cover"
                />
                <View style={styles.infoDestaque}>
                  <View style={styles.badgesDestaque}>
                    <View style={styles.badgeOrdem}>
                      <Text style={styles.txtBadgeOrdem}>
                        {normalizarOrdem(destaqueDoDia.ordem_insetos)}
                      </Text>
                    </View>
                    {!!destaqueDoDia.dieta_insetos && (
                      <View style={styles.badgeDieta}>
                        <Text style={styles.txtBadgeDieta}>{destaqueDoDia.dieta_insetos}</Text>
                      </View>
                    )}
                  </View>

                  <Text numberOfLines={1} style={styles.nomeDestaque}>
                    {destaqueDoDia.nome_insetos}
                  </Text>
                  <Text numberOfLines={1} style={styles.ncDestaque}>
                    {destaqueDoDia.nc_insetos}
                  </Text>
                </View>
              </View>

              {!!destaqueDoDia.curiosidade && (
                <Text numberOfLines={3} style={styles.curiosidadeDestaque}>
                  {destaqueDoDia.curiosidade}
                </Text>
              )}
            </TouchableOpacity>
          ) : (
            <View style={styles.cardDestaqueVazio}>
              <Text style={styles.textoErroDestaque}>
                {erroCarga || 'Nenhuma espécie disponível no momento.'}
              </Text>
            </View>
          )}
        </View>

        <View style={styles.secaoBloco}>
          <Text style={styles.tituloBloco}>Explorar por dieta</Text>
          <ScrollView
            horizontal
            showsHorizontalScrollIndicator={false}
            contentContainerStyle={styles.dietasScroll}
          >
            {DIETAS_RAPIDAS.map((dieta) => (
              <TouchableOpacity
                key={dieta}
                activeOpacity={0.8}
                onPress={() =>
                  router.push({
                    pathname: '/categorias' as any,
                    params: { busca: dieta },
                  })
                }
                style={styles.pillDieta}
              >
                <View style={styles.pontoMiniDieta} />
                <Text style={styles.txtPillDieta}>{dieta}</Text>
              </TouchableOpacity>
            ))}
          </ScrollView>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  containerTela: {
    flex: 1,
    backgroundColor: '#090D16',
  },
  corpoScroll: {
    paddingHorizontal: 18,
    paddingBottom: 44,
    paddingTop: 14,
  },
  headerRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginBottom: 20,
    gap: 12,
  },
  topoSaudacao: {
    flex: 1,
  },
  textoSaudacao: {
    color: '#10B981',
    fontSize: 13,
    fontWeight: '700',
    letterSpacing: 0.3,
    marginBottom: 4,
  },
  tituloApp: {
    color: '#F8FAFC',
    fontSize: 23,
    fontWeight: '800',
    letterSpacing: -0.4,
  },
  botaoConfig: {
    width: 44,
    height: 44,
    borderRadius: 22,
    backgroundColor: '#131B2E',
    borderWidth: 1,
    borderColor: '#1E293B',
    alignItems: 'center',
    justifyContent: 'center',
  },
  iconeConfig: {
    color: '#94A3B8',
    fontSize: 19,
  },
  gradeSecoes: {
    flexDirection: 'row',
    gap: 12,
    marginBottom: 14,
  },
  cardSecao: {
    flex: 1,
    backgroundColor: '#111827',
    borderRadius: 18,
    padding: 15,
    borderWidth: 1,
    borderColor: '#1E293B',
    justifyContent: 'space-between',
    minHeight: 112,
    gap: 6,
  },
  topoCardSecao: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginBottom: 2,
  },
  pontoVerde: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: '#10B981',
  },
  setaCard: {
    color: '#64748B',
    fontSize: 18,
    fontWeight: '700',
  },
  tituloCardSecao: {
    color: '#F8FAFC',
    fontSize: 16.5,
    fontWeight: '700',
  },
  descCardSecao: {
    color: '#94A3B8',
    fontSize: 12.5,
    lineHeight: 17,
  },
  metricasRow: {
    flexDirection: 'row',
    gap: 10,
    marginBottom: 22,
  },
  metricaCard: {
    flex: 1,
    backgroundColor: '#0E1422',
    borderRadius: 14,
    paddingVertical: 12,
    paddingHorizontal: 12,
    borderWidth: 1,
    borderColor: '#1E293B',
    alignItems: 'center',
  },
  metricaValor: {
    color: '#F8FAFC',
    fontSize: 17,
    fontWeight: '800',
  },
  metricaRotulo: {
    color: '#94A3B8',
    fontSize: 11.5,
    fontWeight: '600',
    marginTop: 2,
  },
  metricaCardAtalho: {
    flex: 1.2,
    backgroundColor: '#111827',
    borderRadius: 14,
    paddingVertical: 12,
    paddingHorizontal: 12,
    borderWidth: 1,
    borderColor: 'rgba(16, 185, 129, 0.35)',
    alignItems: 'center',
    justifyContent: 'center',
  },
  metricaAtalhoTexto: {
    color: '#34D399',
    fontSize: 13.5,
    fontWeight: '700',
  },
  metricaAtalhoSub: {
    color: '#94A3B8',
    fontSize: 11,
    marginTop: 2,
  },
  secaoBloco: {
    marginBottom: 20,
    gap: 10,
  },
  cabecalhoBloco: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  tituloBloco: {
    color: '#F8FAFC',
    fontSize: 15,
    fontWeight: '700',
  },
  rotuloDiario: {
    color: '#34D399',
    fontSize: 11.5,
    fontWeight: '700',
    backgroundColor: 'rgba(16, 185, 129, 0.12)',
    paddingHorizontal: 9,
    paddingVertical: 3,
    borderRadius: 999,
  },
  cardDestaque: {
    backgroundColor: '#111827',
    borderRadius: 18,
    padding: 15,
    borderWidth: 1,
    borderColor: '#1E293B',
    gap: 12,
  },
  cardDestaqueVazio: {
    backgroundColor: '#111827',
    borderRadius: 18,
    padding: 20,
    borderWidth: 1,
    borderColor: '#1E293B',
    alignItems: 'center',
    justifyContent: 'center',
    minHeight: 110,
  },
  topoDestaque: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  fotoDestaque: {
    width: 60,
    height: 60,
    borderRadius: 14,
    borderWidth: 1,
    borderColor: '#293548',
  },
  infoDestaque: {
    flex: 1,
    gap: 3,
  },
  badgesDestaque: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 6,
    marginBottom: 2,
  },
  badgeOrdem: {
    backgroundColor: 'rgba(16, 185, 129, 0.14)',
    paddingHorizontal: 8,
    paddingVertical: 2,
    borderRadius: 6,
  },
  txtBadgeOrdem: {
    color: '#34D399',
    fontSize: 11,
    fontWeight: '700',
  },
  badgeDieta: {
    backgroundColor: 'rgba(148, 163, 184, 0.14)',
    paddingHorizontal: 8,
    paddingVertical: 2,
    borderRadius: 6,
  },
  txtBadgeDieta: {
    color: '#CBD5E1',
    fontSize: 11,
    fontWeight: '600',
  },
  nomeDestaque: {
    color: '#F8FAFC',
    fontSize: 16,
    fontWeight: '700',
  },
  ncDestaque: {
    color: '#94A3B8',
    fontSize: 12,
    fontStyle: 'italic',
  },
  curiosidadeDestaque: {
    color: '#CBD5E1',
    fontSize: 13,
    lineHeight: 19,
    paddingTop: 10,
    borderTopWidth: 1,
    borderTopColor: 'rgba(148, 163, 184, 0.12)',
  },
  textoErroDestaque: {
    color: '#94A3B8',
    fontSize: 13,
    textAlign: 'center',
  },
  dietasScroll: {
    gap: 8,
    paddingRight: 6,
  },
  pillDieta: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 7,
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 999,
    paddingHorizontal: 13,
    paddingVertical: 9,
  },
  pontoMiniDieta: {
    width: 6,
    height: 6,
    borderRadius: 3,
    backgroundColor: '#10B981',
  },
  txtPillDieta: {
    color: '#F8FAFC',
    fontSize: 12.5,
    fontWeight: '600',
  },
});
