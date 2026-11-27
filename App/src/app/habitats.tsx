import React, { useState, useEffect, useMemo } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { useRouter } from 'expo-router';
import api from './api';

interface Habitat {
  id_habitats: number;
  nome_habitats: string;
  clima_habitats: string;
  bioma_habitats: string;
  descricao_habitats: string;
}

const HABITATS_BASE: Habitat[] = [
  {
    id_habitats: 1,
    nome_habitats: 'Florestas Úmidas e Serrapilheira',
    clima_habitats: 'Tropical / Temperado Úmido',
    bioma_habitats: 'Floresta Tropical',
    descricao_habitats:
      'Camada rica em folhas caídas, troncos em decomposição e umidade constante, abrigo de besouros, opiliões e caracóis.',
  },
  {
    id_habitats: 2,
    nome_habitats: 'Recifes de Coral e Costões',
    clima_habitats: 'Marinho Tropical / Subtropical',
    bioma_habitats: 'Recife de Coral',
    descricao_habitats:
      'Ambientes marinhos iluminados e cheios de fendas, ideais para cnidários, equinodermos, moluscos e crustáceos.',
  },
  {
    id_habitats: 3,
    nome_habitats: 'Manguezais e Estuários',
    clima_habitats: 'Costeiro / Salobro',
    bioma_habitats: 'Manguezal',
    descricao_habitats:
      'Solo lodoso influenciado pelas marés com raízes aéreas, lar de caranguejos, siris e ostras.',
  },
  {
    id_habitats: 4,
    nome_habitats: 'Áreas Áridas e Desertos',
    clima_habitats: 'Árido / Semiárido',
    bioma_habitats: 'Deserto e Caatinga',
    descricao_habitats:
      'Ambientes com grande amplitude térmica onde espécies desenvolvem exoesqueleto resistente e hábitos noturnos.',
  },
];

export default function TelaHabitats() {
  const router = useRouter();
  const [habitats, setHabitats] = useState<Habitat[]>(HABITATS_BASE);
  const [carregando, setCarregando] = useState<boolean>(false);
  const [busca, setBusca] = useState<string>('');
  const [selecionadoId, setSelecionadoId] = useState<number | null>(null);

  useEffect(() => {
    let ativo = true;
    const buscarHabitats = async () => {
      try {
        setCarregando(true);
        const resp = await api.get('conexao.php', { params: { habitats: 1 } });
        if (!ativo) return;
        if (Array.isArray(resp.data?.habitats) && resp.data.habitats.length > 0) {
          setHabitats(resp.data.habitats);
        }
      } catch {
        // Mantém os habitats base caso o endpoint ainda não exponha a tabela habitats
      } finally {
        if (ativo) setCarregando(false);
      }
    };
    buscarHabitats();
    return () => {
      ativo = false;
    };
  }, []);

  const filtrados = useMemo(() => {
    const q = busca.trim().toLowerCase();
    if (!q) return habitats;
    return habitats.filter((h) =>
      [h.nome_habitats, h.clima_habitats, h.bioma_habitats, h.descricao_habitats]
        .filter(Boolean)
        .some((campo) => campo.toLowerCase().includes(q))
    );
  }, [habitats, busca]);

  return (
    <SafeAreaView style={styles.tela}>
      <StatusBar style="light" />
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        <View style={styles.topo}>
          <TouchableOpacity onPress={() => router.back()} style={styles.btnVoltar}>
            <Text style={styles.txtVoltar}>‹ Voltar</Text>
          </TouchableOpacity>
          <Text style={styles.titulo}>Habitats</Text>
        </View>

        <TextInput
          style={styles.input}
          value={busca}
          onChangeText={setBusca}
          placeholder="Buscar por bioma, clima ou habitat..."
          placeholderTextColor="#64748B"
        />

        {carregando && habitats.length === 0 ? (
          <ActivityIndicator size="large" color="#10B981" style={{ marginTop: 24 }} />
        ) : (
          <View style={styles.lista}>
            {filtrados.map((hab) => {
              const aberto = selecionadoId === hab.id_habitats;
              return (
                <TouchableOpacity
                  key={hab.id_habitats}
                  activeOpacity={0.85}
                  onPress={() => setSelecionadoId(aberto ? null : hab.id_habitats)}
                  style={[styles.card, aberto && styles.cardAtivo]}
                >
                  <Text style={styles.nome}>{hab.nome_habitats}</Text>
                  <View style={styles.chips}>
                    {!!hab.bioma_habitats && (
                      <View style={styles.chip}>
                        <Text style={styles.chipTxt}>{hab.bioma_habitats}</Text>
                      </View>
                    )}
                    {!!hab.clima_habitats && (
                      <View style={styles.chipSec}>
                        <Text style={styles.chipSecTxt}>{hab.clima_habitats}</Text>
                      </View>
                    )}
                  </View>
                  {aberto && !!hab.descricao_habitats && (
                    <Text style={styles.desc}>{hab.descricao_habitats}</Text>
                  )}
                </TouchableOpacity>
              );
            })}
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
  titulo: { color: '#F8FAFC', fontSize: 21, fontWeight: '800' },
  input: {
    height: 48,
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1F2937',
    borderRadius: 14,
    paddingHorizontal: 16,
    color: '#F8FAFC',
    fontSize: 14.5,
    marginBottom: 16,
  },
  lista: { gap: 12 },
  card: {
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 16,
    padding: 16,
    gap: 8,
  },
  cardAtivo: { borderColor: '#10B981' },
  nome: { color: '#F8FAFC', fontSize: 16, fontWeight: '700' },
  chips: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  chip: {
    backgroundColor: 'rgba(16, 185, 129, 0.14)',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
  },
  chipTxt: { color: '#34D399', fontSize: 11.5, fontWeight: '700' },
  chipSec: {
    backgroundColor: 'rgba(148, 163, 184, 0.14)',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
  },
  chipSecTxt: { color: '#CBD5E1', fontSize: 11.5, fontWeight: '600' },
  desc: { color: '#CBD5E1', fontSize: 13, lineHeight: 19, marginTop: 4 },
});
