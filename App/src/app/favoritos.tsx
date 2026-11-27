import React, { useState, useCallback, useMemo } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
  Alert,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { Image } from 'expo-image';
import { useRouter, useFocusEffect } from 'expo-router';
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

function normalizarBusca(texto: string): string {
  return texto
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .trim();
}

export default function TelaFavoritos() {
  const router = useRouter();

  const [todosBichos, setTodosBichos] = useState<Bicho[]>([]);
  const [idsFavoritos, setIdsFavoritos] = useState<number[]>([]);
  const [carregando, setCarregando] = useState<boolean>(true);
  const [busca, setBusca] = useState<string>('');
  const [selecionadoId, setSelecionadoId] = useState<number | null>(null);

  const carregarFavoritos = useCallback(async () => {
    try {
      setCarregando(true);
      const [ids, resposta] = await Promise.all([
        obterFavoritosIds(),
        api.get('conexao.php', { params: { all: 1, limit: 1000 } }),
      ]);

      const dados: Bicho[] = Array.isArray(resposta.data?.dados)
        ? resposta.data.dados
        : Array.isArray(resposta.data)
        ? resposta.data
        : [];

      setIdsFavoritos(ids);
      setTodosBichos(dados);
    } catch (erro: any) {
      Alert.alert('Erro', mensagemDeErro(erro, 'Não foi possível carregar os favoritos.'));
    } finally {
      setCarregando(false);
    }
  }, []);

  useFocusEffect(
    useCallback(() => {
      carregarFavoritos();
    }, [carregarFavoritos])
  );

  const especiesFavoritas = useMemo(() => {
    const setIds = new Set(idsFavoritos);
    const base = todosBichos.filter((bicho) => setIds.has(Number(bicho.id_insetos)));
    const termo = normalizarBusca(busca);
    if (!termo) return base;

    return base.filter((bicho) =>
      [bicho.nome_insetos, bicho.nc_insetos, bicho.ordem_insetos, bicho.familia_insetos, bicho.dieta_insetos]
        .filter(Boolean)
        .some((campo) => normalizarBusca(String(campo)).includes(termo))
    );
  }, [todosBichos, idsFavoritos, busca]);

  const handleRemoverFavorito = async (idInseto: number) => {
    const atualizados = await alternarFavoritoId(idInseto);
    setIdsFavoritos(atualizados);
    if (selecionadoId === idInseto) {
      setSelecionadoId(null);
    }
  };

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
          <View style={styles.topoInfo}>
            <Text style={styles.titulo}>Favoritos</Text>
            <Text style={styles.contador}>
              {idsFavoritos.length} {idsFavoritos.length === 1 ? 'espécie salva' : 'espécies salvas'}
            </Text>
          </View>
        </View>

        <View style={styles.areaBusca}>
          <TextInput
            style={styles.inputBusca}
            value={busca}
            onChangeText={setBusca}
            placeholder="Filtrar nos seus favoritos..."
            placeholderTextColor="#64748B"
          />
          {busca.length > 0 && (
            <TouchableOpacity
              activeOpacity={0.7}
              onPress={() => setBusca('')}
              style={styles.btnLimpar}
              hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
            >
              <Text style={styles.txtLimpar}>✕</Text>
            </TouchableOpacity>
          )}
        </View>

        {carregando && todosBichos.length === 0 ? (
          <ActivityIndicator size="large" color="#10B981" style={{ marginTop: 30 }} />
        ) : especiesFavoritas.length > 0 ? (
          <View style={styles.lista}>
            {especiesFavoritas.map((bicho) => {
              const aberto = selecionadoId === bicho.id_insetos;

              return (
                <TouchableOpacity
                  key={bicho.id_insetos}
                  activeOpacity={0.86}
                  onPress={() => setSelecionadoId(aberto ? null : bicho.id_insetos)}
                  style={[styles.card, aberto && styles.cardAtivo]}
                >
                  <View style={styles.linhaPrincipal}>
                    <Image
                      source={{ uri: bicho.foto_insetos || 'https://via.placeholder.com/100' }}
                      style={styles.foto}
                      contentFit="cover"
                    />

                    <View style={styles.info}>
                      <Text numberOfLines={1} style={styles.nome}>
                        {bicho.nome_insetos || 'Sem nome'}
                      </Text>
                      <Text numberOfLines={1} style={styles.nc}>
                        {bicho.nc_insetos || 'Nome científico indisponível'}
                      </Text>
                    </View>

                    <TouchableOpacity
                      activeOpacity={0.75}
                      onPress={() => handleRemoverFavorito(bicho.id_insetos)}
                      style={styles.btnFavorito}
                      hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
                      accessibilityLabel="Remover dos favoritos"
                    >
                      <Text style={styles.iconeFavoritoAtivo}>♥</Text>
                    </TouchableOpacity>
                  </View>

                  {aberto && (
                    <View style={styles.detalhes}>
                      <View style={styles.chips}>
                        {!!bicho.ordem_insetos && (
                          <View style={styles.chip}>
                            <Text style={styles.chipTxt}>{bicho.ordem_insetos}</Text>
                          </View>
                        )}
                        {!!bicho.familia_insetos && (
                          <View style={styles.chipSec}>
                            <Text style={styles.chipSecTxt}>{bicho.familia_insetos}</Text>
                          </View>
                        )}
                        {!!bicho.dieta_insetos && (
                          <View style={styles.chipSec}>
                            <Text style={styles.chipSecTxt}>{bicho.dieta_insetos}</Text>
                          </View>
                        )}
                      </View>

                      {!!bicho.curiosidade && (
                        <Text style={styles.curiosidade}>{bicho.curiosidade}</Text>
                      )}
                    </View>
                  )}
                </TouchableOpacity>
              );
            })}
          </View>
        ) : (
          <View style={styles.vazioBox}>
            <Text style={styles.vazioTitulo}>
              {busca.trim() ? 'Nenhum favorito corresponde à busca' : 'Nenhuma espécie favoritada ainda'}
            </Text>
            <Text style={styles.vazioSub}>
              {busca.trim()
                ? 'Tente outro termo ou limpe o filtro.'
                : 'Toque no coração das espécies em Categorias para salvá-las aqui.'}
            </Text>
            {!busca.trim() && (
              <TouchableOpacity
                activeOpacity={0.82}
                onPress={() => router.push('/categorias' as any)}
                style={styles.btnExplorar}
              >
                <Text style={styles.txtExplorar}>Ir para Categorias</Text>
              </TouchableOpacity>
            )}
          </View>
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
  topoInfo: { flex: 1 },
  titulo: { color: '#F8FAFC', fontSize: 21, fontWeight: '800', letterSpacing: -0.3 },
  contador: { color: '#34D399', fontSize: 12, fontWeight: '600', marginTop: 2 },
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
  btnLimpar: {
    position: 'absolute',
    right: 12,
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: '#1E293B',
    alignItems: 'center',
    justifyContent: 'center',
  },
  txtLimpar: { color: '#94A3B8', fontSize: 11, fontWeight: '700' },
  lista: { gap: 10 },
  card: {
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 16,
    padding: 12,
  },
  cardAtivo: {
    borderColor: '#10B981',
    backgroundColor: '#131E2E',
  },
  linhaPrincipal: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  foto: {
    width: 46,
    height: 46,
    borderRadius: 23,
    borderWidth: 1,
    borderColor: '#293548',
  },
  info: { flex: 1 },
  nome: { color: '#F8FAFC', fontSize: 14.5, fontWeight: '700' },
  nc: { color: '#94A3B8', fontSize: 12, fontStyle: 'italic', marginTop: 1 },
  btnFavorito: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: 'rgba(16, 185, 129, 0.12)',
    borderWidth: 1,
    borderColor: 'rgba(16, 185, 129, 0.35)',
    alignItems: 'center',
    justifyContent: 'center',
  },
  iconeFavoritoAtivo: {
    color: '#10B981',
    fontSize: 16,
  },
  detalhes: {
    marginTop: 10,
    paddingTop: 10,
    borderTopWidth: 1,
    borderTopColor: 'rgba(148, 163, 184, 0.14)',
    gap: 8,
  },
  chips: { flexDirection: 'row', flexWrap: 'wrap', gap: 6 },
  chip: {
    backgroundColor: 'rgba(16, 185, 129, 0.14)',
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 6,
  },
  chipTxt: { color: '#34D399', fontSize: 11, fontWeight: '700' },
  chipSec: {
    backgroundColor: 'rgba(148, 163, 184, 0.14)',
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 6,
  },
  chipSecTxt: { color: '#CBD5E1', fontSize: 11, fontWeight: '600' },
  curiosidade: { color: '#CBD5E1', fontSize: 12.5, lineHeight: 18 },
  vazioBox: {
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 18,
    padding: 24,
    alignItems: 'center',
    gap: 8,
    marginTop: 12,
  },
  vazioTitulo: { color: '#F8FAFC', fontSize: 15.5, fontWeight: '700', textAlign: 'center' },
  vazioSub: { color: '#94A3B8', fontSize: 13, textAlign: 'center', lineHeight: 18 },
  btnExplorar: {
    marginTop: 8,
    backgroundColor: '#10B981',
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: 10,
  },
  txtExplorar: { color: '#06281E', fontSize: 13, fontWeight: '800' },
});
