import React, { useState, useEffect, useRef } from 'react';
import {View, Text, StyleSheet, TextInput, ActivityIndicator, FlatList, StatusBar, TouchableOpacity} from 'react-native';
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

export default function Teste() {
  const [listaDeBichos, setListaDeBichos] = useState<Bicho[]>([]);
  const [carregando, setCarregando] = useState<boolean>(true);
  const [busca, setBusca] = useState<string>('');
  
  const [paginaAtual, setPaginaAtual] = useState<number>(1);
  const ITENS_POR_PAGINA = 20;

  const flatListRef = useRef<FlatList>(null);

  useEffect(() => {
    api.get<Bicho[]>('banco.php')
      .then((resposta) => {
        if (Array.isArray(resposta.data)) {
          setListaDeBichos(resposta.data);
        } else {
          setListaDeBichos([]);
        }
      })
      .catch((erro) => {
        console.error('Erro ao buscar dados do banco:', erro);
        setListaDeBichos([]);
      })
      .finally(() => {
        setCarregando(false);
      });
  }, []);

 
  const handleBusca = (texto: string) => {
    setBusca(texto);
    setPaginaAtual(1);
  };

  
  const filtrarAnimal = Array.isArray(listaDeBichos)
    ? listaDeBichos.filter((bicho) =>
        bicho?.nome_insetos?.toLowerCase().includes(busca.toLowerCase())
      )
    : [];

  const totalPaginas = Math.ceil(filtrarAnimal.length / ITENS_POR_PAGINA) || 1;

  const inicio = (paginaAtual - 1) * ITENS_POR_PAGINA;
  const dadosPaginados = filtrarAnimal.slice(inicio, inicio + ITENS_POR_PAGINA);

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

  if (carregando) {
    return (
      <SafeAreaProvider>
        <SafeAreaView style={styles.centerLoading}>
          <StatusBar barStyle="light-content" backgroundColor="#111" />
          <ActivityIndicator size="large" color="#a100cc" />
        </SafeAreaView>
      </SafeAreaProvider>
    );
  }

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.containerTela}>
        <StatusBar barStyle="light-content" backgroundColor="#111" />

        <FlatList
          ref={flatListRef}
          data={dadosPaginados}
          keyExtractor={(item) => item.id_insetos.toString()}
          numColumns={2}
          columnWrapperStyle={styles.linhaGrid}
          contentContainerStyle={styles.corpoFlatList}
          showsVerticalScrollIndicator={false}
          ListHeaderComponent={
            <View style={styles.cabecalho}>
              <Text style={styles.tituloApp}>Wiki Invertebrados - app</Text> 
              <TextInput 
                style={styles.pesquisa} 
                value={busca} 
                onChangeText={handleBusca}
                placeholder="Pesquisar..."
                placeholderTextColor="#888"
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
            <Text style={styles.textoVazio}>
              Nenhum invertebrado encontrado.
            </Text>
          }
          ListFooterComponent={
            filtrarAnimal.length > 0 ? (
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
            ) : null
          }
        />
      </SafeAreaView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  containerTela: {
    flex: 1,
    backgroundColor: '#111',
  },

  centerLoading: {
    flex: 1,
    backgroundColor: '#111',
    justifyContent: 'center',
    alignItems: 'center',
  },

  corpoFlatList: {
    paddingHorizontal: 12,
    paddingBottom: 40,
  },

  linhaGrid: {
    justifyContent: 'space-between',
    marginBottom: 12,
  },

  cabecalho: {
    width: '100%',
    alignItems: 'center',
    paddingTop: 8,
  },

  tituloApp: {
    color: '#f1f1f1',
    fontSize: 22,
    fontWeight: 'bold',
    marginBottom: 16,
    textAlign: 'center',
  },

  pesquisa: {
    width: '100%',
    height: 48,
    color: '#fff',
    backgroundColor: '#1c1c1c',
    borderRadius: 25, 
    borderWidth: 2, 
    borderColor: '#a100cc', 
    paddingHorizontal: 20, 
    marginBottom: 20,
  },

  cardBesouro: {
    backgroundColor: '#1c1c1c',
    borderRadius: 16,
    padding: 12,
    width: '48.5%',
    alignItems: 'center', 
    gap: 10,
  },

  imagemBesouro: {
    height: 90,
    width: 90,
    borderRadius: 45,
  },

  containerInfos: {
    width: '100%',
    gap: 4,
  },

  nome: {
    color: '#f1f1f1',
    fontSize: 14,
    fontWeight: 'bold',
    textAlign: 'center',
  },

  nc: {
    color: '#aaa',
    fontSize: 11,
    fontStyle: 'italic',
    textAlign: 'center',
  },

  curiosidade: {
    color: '#ddd',
    fontSize: 11,
    textAlign: 'center',
  },

  textoVazio: {
    color: '#aaa',
    marginTop: 20,
    textAlign: 'center',
  },

  containerPaginacao: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 25,
    gap: 6,
    width: '100%',
  },

  numerosContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
  },

  btnNumero: {
    minWidth: 32,
    height: 32,
    borderRadius: 16,
    backgroundColor: '#1c1c1c',
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: 6,
  },

  btnNumeroAtivo: {
    backgroundColor: '#a100cc',
  },

  textoNumero: {
    color: '#aaa',
    fontSize: 13,
    fontWeight: '600',
  },

  textoNumeroAtivo: {
    color: '#fff',
    fontWeight: 'bold',
  },

  textoReticencias: {
    color: '#666',
    paddingHorizontal: 2,
    fontSize: 13,
  },

  btnSeta: {
    width: 32,
    height: 32,
    borderRadius: 16,
    backgroundColor: '#1c1c1c',
    alignItems: 'center',
    justifyContent: 'center',
  },

  btnDesabilitado: {
    opacity: 0.3,
  },

  textoSeta: {
    color: '#a100cc',
    fontSize: 18,
    fontWeight: 'bold',
  },
});
