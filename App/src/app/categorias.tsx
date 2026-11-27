import React, { useState, useEffect, useMemo, useCallback } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  ActivityIndicator,
  ScrollView,
  TouchableOpacity,
  Alert,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { Image } from 'expo-image';
import { useRouter, useLocalSearchParams, useFocusEffect } from 'expo-router';
import api, { mensagemDeErro } from './api';
import { obterFavoritosIds, alternarFavoritoId } from './favoritosStorage';

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

const LIMITE_INICIAL_ORDEM = 5;

const ORDENS_PADRAO = [
  'Insetos',
  'Aracnídeos',
  'Crustáceos',
  'Moluscos',
  'Cnidário',
  'Equinodermo',
];

function normalizarOrdem(valor?: string): string {
  const limpo = (valor || 'Sem ordem').trim().replace(/\s+/g, ' ');
  if (!limpo) return 'Sem ordem';

  const encontrada = ORDENS_PADRAO.find((item) => item.toLowerCase() === limpo.toLowerCase());
  if (encontrada) return encontrada;

  return limpo.charAt(0).toUpperCase() + limpo.slice(1);
}

function normalizarBusca(texto: string): string {
  return texto
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .trim();
}

export default function TelaCategorias() {
  const router = useRouter();
  const params = useLocalSearchParams<{ ordem?: string; busca?: string }>();

  const paramOrdem = Array.isArray(params.ordem) ? params.ordem[0] : params.ordem;
  const paramBusca = Array.isArray(params.busca) ? params.busca[0] : params.busca;

  const [listaDeBichos, setListaDeBichos] = useState<Bicho[]>([]);
  const [favoritosIds, setFavoritosIds] = useState<number[]>([]);
  const [carregando, setCarregando] = useState<boolean>(true);
  const [busca, setBusca] = useState<string>(paramBusca || '');
  const [ordemSelecionada, setOrdemSelecionada] = useState<string>(
    paramOrdem ? normalizarOrdem(paramOrdem) : 'Insetos'
  );
  const [expandida, setExpandida] = useState<boolean>(false);
  const [bichoAbertoId, setBichoAbertoId] = useState<number | null>(null);

  useEffect(() => {
    if (paramOrdem) {
      setOrdemSelecionada(normalizarOrdem(paramOrdem));
      setExpandida(false);
      setBichoAbertoId(null);
    }
  }, [paramOrdem]);

  useEffect(() => {
    if (typeof paramBusca === 'string') {
      setBusca(paramBusca);
      setExpandida(false);
    }
  }, [paramBusca]);

  useFocusEffect(
    useCallback(() => {
      let ativo = true;
      obterFavoritosIds().then((ids) => {
        if (ativo) setFavoritosIds(ids);
      });
      return () => {
        ativo = false;
      };
    }, [])
  );

  const handleToggleFavorito = async (idInseto: number) => {
    const atualizados = await alternarFavoritoId(idInseto);
    setFavoritosIds(atualizados);
  };

  useEffect(() => {
    let ativo = true;

    const carregar = async () => {
      try {
        setCarregando(true);
        const resposta = await api.get('conexao.php', {
          params: { all: 1, limit: 1000 },
        });

        if (!ativo) return;

        if (resposta.data && Array.isArray(resposta.data.dados)) {
          setListaDeBichos(resposta.data.dados);
        } else if (Array.isArray(resposta.data)) {
          setListaDeBichos(resposta.data);
        } else {
          setListaDeBichos([]);
        }
      } catch (erro: any) {
        if (!ativo) return;
        Alert.alert('Erro', mensagemDeErro(erro, 'Falha ao carregar categorias.'));
      } finally {
        if (ativo) setCarregando(false);
      }
    };

    carregar();
    return () => {
      ativo = false;
    };
  }, []);

  const grupos = useMemo(() => {
    const mapa = new Map<string, Bicho[]>();
    for (const ordem of ORDENS_PADRAO) {
      mapa.set(ordem, []);
    }

    const termo = normalizarBusca(busca);
    const filtrados = termo
      ? listaDeBichos.filter((b) =>
          [b.nome_insetos, b.nc_insetos, b.ordem_insetos, b.familia_insetos, b.dieta_insetos]
            .filter(Boolean)
            .some((v) => normalizarBusca(String(v)).includes(termo))
        )
      : listaDeBichos;

    for (const bicho of filtrados) {
      const chaveOrdem = normalizarOrdem(bicho.ordem_insetos);
      const atual = mapa.get(chaveOrdem) || [];
      atual.push(bicho);
      mapa.set(chaveOrdem, atual);
    }

    return Array.from(mapa.entries()).map(([ordem, itens]) => ({ ordem, itens }));
  }, [listaDeBichos, busca]);

  const grupoAtivo = useMemo(() => {
    const exato = grupos.find((g) => g.ordem === ordemSelecionada);
    if (exato && (exato.itens.length > 0 || !busca.trim())) {
      return exato;
    }
    if (busca.trim()) {
      const comResultados = grupos.find((g) => g.itens.length > 0);
      if (comResultados) return comResultados;
    }
    return exato || grupos[0] || null;
  }, [grupos, ordemSelecionada, busca]);

  const itensExibidos = useMemo(() => {
    if (!grupoAtivo) return [];
    if (expandida || busca.trim()) return grupoAtivo.itens;
    return grupoAtivo.itens.slice(0, LIMITE_INICIAL_ORDEM);
  }, [grupoAtivo, expandida, busca]);

  const temMais = !!grupoAtivo && grupoAtivo.itens.length > LIMITE_INICIAL_ORDEM && !busca.trim();

  return (
    <SafeAreaView style={styles.tela}>
      <StatusBar style="light" />
      <ScrollView
        contentContainerStyle={styles.scroll}
        showsVerticalScrollIndicator={false}
        keyboardShouldPersistTaps="handled"
      >
        <View style={styles.topo}>
          <TouchableOpacity onPress={() => router.back()} style={styles.btnVoltar}>
            <Text style={styles.txtVoltar}>‹ Voltar</Text>
          </TouchableOpacity>
          <Text style={styles.titulo}>Categorias por Ordem</Text>
        </View>

        <View style={styles.areaBusca}>
          <TextInput
            style={styles.inputBusca}
            value={busca}
            onChangeText={(txt) => {
              setBusca(txt);
              setExpandida(false);
            }}
            placeholder="Filtrar espécie, família ou dieta..."
            placeholderTextColor="#64748B"
          />
          {busca.length > 0 && (
            <TouchableOpacity
              activeOpacity={0.7}
              onPress={() => setBusca('')}
              style={styles.btnLimparBusca}
              hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
            >
              <Text style={styles.txtLimparBusca}>✕</Text>
            </TouchableOpacity>
          )}
        </View>

        {carregando && listaDeBichos.length === 0 ? (
          <ActivityIndicator size="large" color="#10B981" style={{ marginTop: 30 }} />
        ) : (
          <>
            {/* Cards das ordens */}
            <ScrollView
              horizontal
              showsHorizontalScrollIndicator={false}
              contentContainerStyle={styles.rowOrdens}
            >
              {grupos.map((g) => {
                const ativa = g.ordem === grupoAtivo?.ordem;
                return (
                  <TouchableOpacity
                    key={g.ordem}
                    activeOpacity={0.85}
                    onPress={() => {
                      setOrdemSelecionada(g.ordem);
                      setExpandida(false);
                      setBichoAbertoId(null);
                    }}
                    style={[styles.cardOrdemPill, ativa && styles.cardOrdemPillAtiva]}
                  >
                    <Text style={[styles.nomeOrdemPill, ativa && styles.nomeOrdemPillAtiva]}>
                      {g.ordem}
                    </Text>
                    <Text style={[styles.qtdOrdemPill, ativa && styles.qtdOrdemPillAtiva]}>
                      {g.itens.length}
                    </Text>
                  </TouchableOpacity>
                );
              })}
            </ScrollView>

            {/* Card da ordem selecionada com os cards dos bichos dentro */}
            {grupoAtivo && (
              <View style={styles.cardPainelOrdem}>
                <View style={styles.cabecalhoPainel}>
                  <Text style={styles.tituloPainel}>{grupoAtivo.ordem}</Text>
                  <Text style={styles.subPainel}>
                    {itensExibidos.length} de {grupoAtivo.itens.length}
                  </Text>
                </View>

                {itensExibidos.length > 0 ? (
                  <View style={styles.listaCards}>
                    {itensExibidos.map((bicho) => {
                      const aberto = bichoAbertoId === bicho.id_insetos;
                      const isFavorito = favoritosIds.includes(Number(bicho.id_insetos));

                      return (
                        <TouchableOpacity
                          key={bicho.id_insetos}
                          activeOpacity={0.85}
                          onPress={() => setBichoAbertoId(aberto ? null : bicho.id_insetos)}
                          style={[styles.cardBicho, aberto && styles.cardBichoAberto]}
                        >
                          <View style={styles.linhaTopoBicho}>
                            <Image
                              source={{ uri: bicho.foto_insetos || 'https://via.placeholder.com/100' }}
                              style={styles.foto}
                              contentFit="cover"
                            />
                            <View style={styles.infoBicho}>
                              <Text numberOfLines={1} style={styles.nomeBicho}>
                                {bicho.nome_insetos}
                              </Text>
                              <Text numberOfLines={1} style={styles.ncBicho}>
                                {bicho.nc_insetos}
                              </Text>
                            </View>

                            <TouchableOpacity
                              activeOpacity={0.75}
                              onPress={() => handleToggleFavorito(bicho.id_insetos)}
                              hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
                              style={[
                                styles.btnFavorito,
                                isFavorito && styles.btnFavoritoAtivo,
                              ]}
                              accessibilityLabel={
                                isFavorito ? 'Remover dos favoritos' : 'Adicionar aos favoritos'
                              }
                            >
                              <Text
                                style={[
                                  styles.iconeFavorito,
                                  isFavorito && styles.iconeFavoritoAtivo,
                                ]}
                              >
                                {isFavorito ? '♥' : '♡'}
                              </Text>
                            </TouchableOpacity>
                          </View>

                          {aberto && (
                            <View style={styles.extras}>
                              <Text style={styles.meta}>
                                {bicho.familia_insetos} • {bicho.dieta_insetos}
                              </Text>
                              {!!bicho.curiosidade && (
                                <Text style={styles.curiosidade}>{bicho.curiosidade}</Text>
                              )}
                            </View>
                          )}
                        </TouchableOpacity>
                      );
                    })}

                    {temMais && (
                      <TouchableOpacity
                        activeOpacity={0.7}
                        onPress={() => setExpandida((prev) => !prev)}
                        hitSlop={{ top: 10, bottom: 10, left: 24, right: 24 }}
                        style={styles.tracoWrap}
                      >
                        <View style={[styles.traco, expandida && styles.tracoAtivo]} />
                      </TouchableOpacity>
                    )}
                  </View>
                ) : (
                  <Text style={styles.vazio}>Nenhum item encontrado nesta ordem.</Text>
                )}
              </View>
            )}
          </>
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  tela: { flex: 1, backgroundColor: '#090D16' },
  scroll: { padding: 18, paddingBottom: 44 },
  topo: { flexDirection: 'row', alignItems: 'center', gap: 12, marginBottom: 16 },
  btnVoltar: {
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1E293B',
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 10,
  },
  txtVoltar: { color: '#10B981', fontWeight: '700', fontSize: 13 },
  titulo: { color: '#F8FAFC', fontSize: 21, fontWeight: '800' },
  areaBusca: { position: 'relative', justifyContent: 'center', marginBottom: 16 },
  inputBusca: {
    height: 48,
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1F2937',
    borderRadius: 14,
    paddingLeft: 16,
    paddingRight: 40,
    color: '#F8FAFC',
    fontSize: 14.5,
  },
  btnLimparBusca: {
    position: 'absolute',
    right: 12,
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: '#1E293B',
    alignItems: 'center',
    justifyContent: 'center',
  },
  txtLimparBusca: { color: '#94A3B8', fontSize: 11, fontWeight: '700' },
  rowOrdens: { gap: 10, paddingBottom: 6, marginBottom: 16 },
  cardOrdemPill: {
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 14,
    paddingHorizontal: 14,
    paddingVertical: 12,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  cardOrdemPillAtiva: {
    backgroundColor: '#132030',
    borderColor: '#10B981',
  },
  nomeOrdemPill: { color: '#F8FAFC', fontWeight: '700', fontSize: 14 },
  nomeOrdemPillAtiva: { color: '#10B981' },
  qtdOrdemPill: {
    color: '#94A3B8',
    fontSize: 12,
    fontWeight: '700',
  },
  qtdOrdemPillAtiva: { color: '#34D399' },
  cardPainelOrdem: {
    backgroundColor: '#0E1422',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 16,
    padding: 14,
    gap: 10,
  },
  cabecalhoPainel: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  tituloPainel: { color: '#F8FAFC', fontSize: 16, fontWeight: '700' },
  subPainel: { color: '#64748B', fontSize: 12, fontWeight: '600' },
  listaCards: { gap: 8 },
  cardBicho: {
    backgroundColor: '#131B2E',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 12,
    padding: 10,
  },
  cardBichoAberto: { borderColor: '#10B981' },
  linhaTopoBicho: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  foto: { width: 44, height: 44, borderRadius: 22 },
  infoBicho: { flex: 1 },
  nomeBicho: { color: '#F8FAFC', fontSize: 14.5, fontWeight: '700' },
  ncBicho: { color: '#94A3B8', fontSize: 12, fontStyle: 'italic' },
  btnFavorito: {
    width: 34,
    height: 34,
    borderRadius: 17,
    backgroundColor: '#0F172A',
    borderWidth: 1,
    borderColor: '#1E293B',
    alignItems: 'center',
    justifyContent: 'center',
  },
  btnFavoritoAtivo: {
    backgroundColor: 'rgba(16, 185, 129, 0.14)',
    borderColor: '#10B981',
  },
  iconeFavorito: {
    color: '#64748B',
    fontSize: 15,
  },
  iconeFavoritoAtivo: {
    color: '#10B981',
  },
  extras: {
    marginTop: 8,
    paddingTop: 8,
    borderTopWidth: 1,
    borderTopColor: 'rgba(148, 163, 184, 0.14)',
    gap: 4,
  },
  meta: { color: '#34D399', fontSize: 11.5, fontWeight: '700' },
  curiosidade: { color: '#CBD5E1', fontSize: 12, lineHeight: 17 },
  tracoWrap: { paddingVertical: 8, alignItems: 'center', justifyContent: 'center' },
  traco: { width: 48, height: 3.5, borderRadius: 999, backgroundColor: '#334155' },
  tracoAtivo: { backgroundColor: '#10B981' },
  vazio: { color: '#94A3B8', textAlign: 'center', paddingVertical: 14 },
});
