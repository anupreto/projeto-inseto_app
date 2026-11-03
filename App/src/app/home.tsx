import React, { useState, useEffect, useRef } from 'react';
import { View, Text, StyleSheet, TextInput, ActivityIndicator, FlatList, StatusBar, TouchableOpacity } from 'react-native';
import { SafeAreaProvider, SafeAreaView } from 'react-native-safe-area-context';
import { Image } from 'expo-image';
import api from './api';

interface Bicho {
  id_insetos: number;
  nome_insetos: string;
  nc_insetos: string;
  ordem_insetos: string;
  familia_insetos: string;
  dieta_insetos: string;
  destaque: number | boolean;
  curisidade: string; 
  foto_insetos: string;
}

export default function TelaHome() {
  const [listaDeBichos, setListaDeBichos] = useState<Bicho[]>([]);
  const [carregando, setCarregando] = useState<boolean>(true);
  const [busca, setBusca] = useState<string>('');
  const [termoBuscaReal, setTermoBuscaReal] = useState<string>('');
  
  const [paginaAtual, setPaginaAtual] = useState<number>(1);
  const [totalPaginas, setTotalPaginas] = useState<number>(1);

  const flatListRef = useRef<FlatList>(null);
  
  useEffect(() => {
    const timer = setTimeout(() => {
      setTermoBuscaReal(busca);
      setPaginaAtual(1);
    }, 400);

    return () => clearTimeout(timer);
  }, [busca]);
  
  useEffect(() => {
    const carregarDados = async () => {
      try {
        setCarregando(true);
        const resposta = await api.get('conexao.php', {
          params: {
            page: paginaAtual,
            search: termoBuscaReal,
          }
        });

        if (resposta.data && Array.isArray(resposta.data.dados)) {
          setListaDeBichos(resposta.data.dados);
          setTotalPaginas(resposta.data.totalPaginas || 1);
        } else {
          setListaDeBichos([]);
          setTotalPaginas(1);
        }
      } catch (erro) {
        console.error('Erro ao buscar dados do banco:', erro);
        setListaDeBichos([]);
      } finally {
        setCarregando(false);
      }
    };

    carregarDados();
  }, [paginaAtual, termoBuscaReal]);

  const mudePagina = (novaPagina: number) => {
    if (novaPagina >= 1 && novaPagina <= totalPaginas) {
      setPaginaAtual(novaPagina);
      flatListRef.current?.scrollToOffset({ offset: 0, animated: true });
    }
  };

  const renderBotoesPagina = () => {
    const paginas: (number | string)[] = [];

    if (totalPaginas <= 7) {
      for (let i = 1; i <= totalPaginas; i++) paginas.push(i);
    } else {
      paginas.push(1);
      if (paginaAtual > 3) paginas.push('...');
      
      const inicioIntervalo = Math.max(2, paginaAtual - 1);
      const fimIntervalo = Math.min(totalPaginas - 1, paginaAtual + 1);

      for (let i = inicioIntervalo; i <= fimIntervalo; i++) {
        paginas.push(i);
      }

      if (paginaAtual < totalPaginas - 2) paginas.push('...');
      paginas.push(totalPaginas);
    }

    return paginas.map((num, idx) => {
      if (num === '...') {
        return (
          <Text key={`po-reticencias-${idx}`} style={styles.textoReticencias}>
            ...
          </Text>
        );
      }

      const ehAtiva = num === paginaAtual;
      return (
        <TouchableOpacity
          key={`btn-pag-${num}`}
          style={[styles.btnNumero, ehAtiva && styles.btnNumeroAtivo]}
          onPress={() => mudePagina(num as number)}
        >
          <Text style={[styles.textoNumero, ehAtiva && styles.textoNumeroAtivo]}>
            {num}
          </Text>
        </TouchableOpacity>
      );
    });
  };

  if (carregando && listaDeBichos.length === 0) {
    return (
      <SafeAreaProvider>
        <SafeAreaView style={styles.centerLoading}>
          <StatusBar barStyle="light-content" backgroundColor="#0F172A" {...({} as any)} />
          <ActivityIndicator size="large" color="#10B981" />
        </SafeAreaView>
      </SafeAreaProvider>
    );
  }

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.containerTela}>
        <StatusBar barStyle="light-content" backgroundColor="#0F172A" {...({} as any)} />

        <FlatList
          ref={flatListRef}
          data={listaDeBichos}
          keyExtractor={(item) => item.id_insetos.toString()}
          numColumns={2}
          columnWrapperStyle={styles.linhaGrid}
          contentContainerStyle={styles.corpoFlatList}
          showsVerticalScrollIndicator={false}
          ListHeaderComponent={
            <View style={styles.cabecalho}>
              <Text style={styles.tituloApp}>Wiki de Invertebrados 🐛</Text> 
              <TextInput 
                style={styles.pesquisa} 
                value={busca} 
                onChangeText={setBusca}
                placeholder="Pesquisar inseto..."
                placeholderTextColor="#64748B"
              />
            </View>
          }
          renderItem={({ item: bicho }) => (
            <View style={styles.cardBesouro}>
              <Image 
                source={{ uri: bicho.foto_insetos || 'https://via.placeholder.com/100' }} 
                style={styles.imagemBesouro} 
                contentFit="cover"
              />
              
              <View style={styles.containerInfos}>
                <Text numberOfLines={1} style={styles.nome}>{bicho.nome_insetos || 'Sem nome'}</Text>
                <Text numberOfLines={1} style={styles.nc}>{bicho.nc_insetos || 'Nome científico indisponível'}</Text>
                <Text numberOfLines={2} style={styles.curiosidade}>{bicho.curisidade || ''}</Text>
              </View>
            </View>
          )}
          ListEmptyComponent={
            carregando ? (
              <ActivityIndicator size="small" color="#10B981" style={{ marginTop: 20 }} />
            ) : (
              <Text style={styles.textoVazio}>Nenhum invertebrado encontrado.</Text>
            )
          }
          ListFooterComponent={
            listaDeBichos.length > 0 ? (
              <View style={styles.containerPaginacao}>
                <TouchableOpacity 
                  style={[styles.btnSeta, paginaAtual === 1 && styles.btnDesabilitado]}
                  disabled={paginaAtual === 1}
                  onPress={() => mudePagina(paginaAtual - 1)}
                >
                  <Text style={styles.textoSeta}>‹</Text>
                </TouchableOpacity>

                <View style={styles.numerosContainer}>
                  {renderBotoesPagina()}
                </View>

                <TouchableOpacity 
                  style={[styles.btnSeta, paginaAtual === totalPaginas && styles.btnDesabilitado]}
                  disabled={paginaAtual === totalPaginas}
                  onPress={() => mudePagina(paginaAtual + 1)}
                >
                  <Text style={styles.textoSeta}>›</Text>
                </TouchableOpacity>
              </View>
            ) : undefined
          }
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  containerTela: { flex: 1, backgroundColor: '#0F172A' },
  centerLoading: { flex: 1, backgroundColor: '#0F172A', justifyContent: 'center', alignItems: 'center' },
  corpoFlatList: { paddingHorizontal: 16, paddingBottom: 40, paddingTop: 16 },
  linhaGrid: { justifyContent: 'space-between', marginBottom: 16 },
  cabecalho: { width: '100%', alignItems: 'center', marginBottom: 16 },
  tituloApp: { color: '#F8FAFC', fontSize: 22, fontWeight: 'bold', marginBottom: 16, textAlign: 'center' },
  pesquisa: { width: '100%', height: 50, color: '#F8FAFC', backgroundColor: '#1E293B', borderRadius: 10, borderWidth: 1, borderColor: '#334155', paddingHorizontal: 16, fontSize: 16 },
  cardBesouro: { backgroundColor: '#1E293B', borderRadius: 12, padding: 12, width: '48%', alignItems: 'center', gap: 10, borderWidth: 1, borderColor: '#334155' },
  imagemBesouro: { height: 90, width: 90, borderRadius: 45 },
  containerInfos: { width: '100%', gap: 4, alignItems: 'center' },
  nome: { color: '#F8FAFC', fontSize: 14, fontWeight: 'bold', textAlign: 'center' },
  nc: { color: '#94A3B8', fontSize: 11, fontStyle: 'italic', textAlign: 'center' },
  curiosidade: { color: '#CBD5E1', fontSize: 11, textAlign: 'center' },
  textoVazio: { color: '#94A3B8', marginTop: 20, textAlign: 'center' },
  containerPaginacao: { flexDirection: 'row', alignItems: 'center', justifyContent: 'center', marginTop: 25, gap: 6, width: '100%' },
  numerosContainer: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  btnNumero: { minWidth: 32, height: 32, borderRadius: 16, backgroundColor: '#1E293B', alignItems: 'center', justifyContent: 'center', paddingHorizontal: 6, borderWidth: 1, borderColor: '#334155' },
  btnNumeroAtivo: { backgroundColor: '#10B981', borderColor: '#10B981' },
  textoNumero: { color: '#94A3B8', fontSize: 13, fontWeight: '600' },
  textoNumeroAtivo: { color: '#FFFFFF', fontWeight: 'bold' },
  textoReticencias: { color: '#64748B', paddingHorizontal: 2, fontSize: 13 },
  btnSeta: { width: 32, height: 32, borderRadius: 16, backgroundColor: '#1E293B', alignItems: 'center', justifyContent: 'center', borderWidth: 1, borderColor: '#334155' },
  btnDesabilitado: { opacity: 0.3 },
  textoSeta: { color: '#10B981', fontSize: 18, fontWeight: 'bold' },
});