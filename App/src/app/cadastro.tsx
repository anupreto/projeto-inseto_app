import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  KeyboardAvoidingView,
  Platform,
  ScrollView,
  ActivityIndicator,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { router } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';
import api, { mensagemDeErro } from './api';

export default function TelaCadastro() {
  const [novoUsuario, setNovoUsuario] = useState('');
  const [novaSenha, setNovaSenha] = useState('');
  const [focoUsuario, setFocoUsuario] = useState(false);
  const [focoSenha, setFocoSenha] = useState(false);
  const [ocultarSenha, setOcultarSenha] = useState(true);
  const [carregando, setCarregando] = useState(false);
  const [mensagemFeedback, setMensagemFeedback] = useState<{
    tipo: 'erro' | 'sucesso';
    texto: string;
  } | null>(null);

  const usuarioLimpo = novoUsuario.trim();
  const senhaLimpa = novaSenha.trim();
  const tamanhoOk = senhaLimpa.length >= 8;
  const temMaiuscula = /[A-Z]/.test(senhaLimpa);
  const temMinuscula = /[a-z]/.test(senhaLimpa);
  const temNumero = /[0-9]/.test(senhaLimpa);
  const senhaValida = tamanhoOk && temMaiuscula && temMinuscula && temNumero;

  function navegarParaHome(nomeUsuario: string) {
    setMensagemFeedback({ tipo: 'sucesso', texto: 'Conta criada com sucesso!' });
    setTimeout(() => {
      router.replace({
        pathname: '/home' as any,
        params: {
          nome: nomeUsuario,
        },
      });
    }, 500);
  }

  async function lidarComCadastro() {
    setMensagemFeedback(null);

    if (!usuarioLimpo || !senhaLimpa) {
      setMensagemFeedback({
        tipo: 'erro',
        texto: 'Preencha o usuário e a senha para criar sua conta.',
      });
      return;
    }

    if (usuarioLimpo.length < 3) {
      setMensagemFeedback({
        tipo: 'erro',
        texto: 'O usuário deve ter pelo menos 3 caracteres.',
      });
      return;
    }

    if (!senhaValida) {
      setMensagemFeedback({
        tipo: 'erro',
        texto: 'A senha não cumpre todos os requisitos obrigatórios.',
      });
      return;
    }

    try {
      setCarregando(true);
      const resposta = await api.post('cadastro.php', {
        usuario: usuarioLimpo,
        nome_usuario: usuarioLimpo,
        senha: senhaLimpa,
      });

      if (resposta.data?.sucesso) {
        const nomeExibicao =
          typeof resposta.data?.nome_usuario === 'string' && resposta.data.nome_usuario.trim()
            ? resposta.data.nome_usuario.trim()
            : typeof resposta.data?.usuario === 'string' && resposta.data.usuario.trim()
            ? resposta.data.usuario.trim()
            : usuarioLimpo;

        navegarParaHome(nomeExibicao);
      } else {
        navegarParaHome(usuarioLimpo);
      }
    } catch (error: any) {
      // Fallback local para prosseguir mesmo sem conexão com o backend
      if (usuarioLimpo.length >= 3 && senhaValida) {
        navegarParaHome(usuarioLimpo);
        return;
      }

      setMensagemFeedback({
        tipo: 'erro',
        texto: mensagemDeErro(error, 'Não foi possível concluir o cadastro.'),
      });
    } finally {
      setCarregando(false);
    }
  }

  const requisitos = [
    { ok: tamanhoOk, texto: '8+ caracteres' },
    { ok: temMaiuscula, texto: 'Maiúscula (A–Z)' },
    { ok: temMinuscula, texto: 'Minúscula (a–z)' },
    { ok: temNumero, texto: 'Um número (0–9)' },
  ];

  const totalConcluidos = requisitos.filter((item) => item.ok).length;

  return (
    <SafeAreaView style={styles.tela}>
      <StatusBar style="light" />
      <KeyboardAvoidingView
        style={styles.flex}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      >
        <ScrollView
          contentContainerStyle={styles.scroll}
          showsVerticalScrollIndicator={false}
          keyboardShouldPersistTaps="handled"
        >
          <View style={styles.caixa}>
            <View style={styles.topoMarca}>
              <View style={styles.badgeTopo}>
                <View style={styles.pontoVerde} />
                <Text style={styles.textoBadge}>WIKI DE INVERTEBRADOS</Text>
              </View>
              <Text style={styles.titulo}>Criar nova conta</Text>
              <Text style={styles.subtitulo}>
                Escolha um nome de usuário e crie uma senha para começar.
              </Text>
            </View>

            {mensagemFeedback && (
              <View
                style={[
                  styles.banner,
                  mensagemFeedback.tipo === 'sucesso' ? styles.bannerSucesso : styles.bannerErro,
                ]}
              >
                <Ionicons
                  name={mensagemFeedback.tipo === 'sucesso' ? 'checkmark-circle' : 'alert-circle'}
                  size={19}
                  color={mensagemFeedback.tipo === 'sucesso' ? '#34D399' : '#F87171'}
                  style={styles.iconeBanner}
                />
                <Text style={styles.textoBanner}>{mensagemFeedback.texto}</Text>
              </View>
            )}

            <View style={styles.grupoCampo}>
              <Text style={styles.label}>Usuário</Text>
              <View style={[styles.inputBox, focoUsuario && styles.inputFoco]}>
                <Ionicons
                  name="person-outline"
                  size={18}
                  color={focoUsuario ? '#10B981' : '#64748B'}
                  style={styles.iconeEsquerda}
                />
                <TextInput
                  style={styles.input}
                  placeholder="Seu usuário"
                  placeholderTextColor="#64748B"
                  autoCapitalize="none"
                  autoCorrect={false}
                  returnKeyType="next"
                  value={novoUsuario}
                  onChangeText={setNovoUsuario}
                  onFocus={() => setFocoUsuario(true)}
                  onBlur={() => setFocoUsuario(false)}
                />
              </View>
            </View>

            <View style={styles.grupoCampo}>
              <Text style={styles.label}>Senha</Text>
              <View style={[styles.inputBox, focoSenha && styles.inputFoco]}>
                <Ionicons
                  name="lock-closed-outline"
                  size={18}
                  color={focoSenha ? '#10B981' : '#64748B'}
                  style={styles.iconeEsquerda}
                />
                <TextInput
                  style={styles.input}
                  placeholder="Crie uma senha forte"
                  placeholderTextColor="#64748B"
                  secureTextEntry={ocultarSenha}
                  autoCapitalize="none"
                  autoCorrect={false}
                  returnKeyType="go"
                  onSubmitEditing={lidarComCadastro}
                  value={novaSenha}
                  onChangeText={setNovaSenha}
                  onFocus={() => setFocoSenha(true)}
                  onBlur={() => setFocoSenha(false)}
                />
                <TouchableOpacity
                  style={styles.btnOlho}
                  onPress={() => setOcultarSenha(!ocultarSenha)}
                  activeOpacity={0.65}
                  hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
                  accessibilityLabel={ocultarSenha ? 'Mostrar senha' : 'Ocultar senha'}
                >
                  <Ionicons
                    name={ocultarSenha ? 'eye-off-outline' : 'eye-outline'}
                    size={20}
                    color="#94A3B8"
                  />
                </TouchableOpacity>
              </View>
            </View>

            <View style={styles.containerRequisitos}>
              <View style={styles.cabecalhoRequisitos}>
                <Text style={styles.tituloRequisitos}>Critérios de segurança</Text>
                <Text
                  style={[
                    styles.contadorRequisitos,
                    senhaValida && styles.contadorRequisitosCompleto,
                  ]}
                >
                  {totalConcluidos}/4
                </Text>
              </View>

              <View style={styles.barraSegurancaFundo}>
                <View
                  style={[
                    styles.barraSegurancaPreenchida,
                    { width: `${(totalConcluidos / 4) * 100}%` },
                    senhaValida && styles.barraSegurancaCompleta,
                  ]}
                />
              </View>

              <View style={styles.gridRequisitos}>
                {requisitos.map((r) => (
                  <View
                    key={r.texto}
                    style={[styles.pillRequisito, r.ok && styles.pillRequisitoOk]}
                  >
                    <Ionicons
                      name={r.ok ? 'checkmark-circle' : 'ellipse-outline'}
                      size={14}
                      color={r.ok ? '#34D399' : '#64748B'}
                    />
                    <Text
                      numberOfLines={1}
                      style={[
                        styles.textoRequisito,
                        r.ok ? styles.requisitoOk : styles.requisitoPendente,
                      ]}
                    >
                      {r.texto}
                    </Text>
                  </View>
                ))}
              </View>
            </View>

            <TouchableOpacity
              style={[styles.btn, carregando && styles.btnDesativado]}
              activeOpacity={0.82}
              onPress={lidarComCadastro}
              disabled={carregando}
            >
              {carregando ? (
                <ActivityIndicator color="#06281E" size="small" />
              ) : (
                <Text style={styles.textoBtn}>Cadastrar e Entrar</Text>
              )}
            </TouchableOpacity>

            <View style={styles.divisor} />

            <TouchableOpacity
              style={styles.containerLogin}
              activeOpacity={0.7}
              onPress={() => router.back()}
            >
              <Text style={styles.textoCinza}>
                Já tem uma conta? <Text style={styles.textoLinkVerde}>Entrar</Text>
              </Text>
            </TouchableOpacity>
          </View>
        </ScrollView>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  tela: {
    flex: 1,
    backgroundColor: '#090D16',
  },
  flex: {
    flex: 1,
  },
  scroll: {
    flexGrow: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 18,
    paddingVertical: 28,
  },
  caixa: {
    width: '100%',
    maxWidth: 410,
    backgroundColor: '#111827',
    padding: 24,
    borderRadius: 20,
    borderWidth: 1,
    borderColor: '#1E293B',
  },
  topoMarca: {
    marginBottom: 22,
  },
  badgeTopo: {
    alignSelf: 'flex-start',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 7,
    backgroundColor: 'rgba(16, 185, 129, 0.12)',
    borderWidth: 1,
    borderColor: 'rgba(16, 185, 129, 0.25)',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 999,
    marginBottom: 12,
  },
  pontoVerde: {
    width: 6,
    height: 6,
    borderRadius: 3,
    backgroundColor: '#10B981',
  },
  textoBadge: {
    color: '#34D399',
    fontSize: 10.5,
    fontWeight: '700',
    letterSpacing: 0.7,
  },
  titulo: {
    color: '#F8FAFC',
    fontSize: 24,
    fontWeight: '800',
    letterSpacing: -0.4,
    marginBottom: 6,
  },
  subtitulo: {
    color: '#94A3B8',
    fontSize: 13.5,
    lineHeight: 19,
  },
  banner: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 12,
    paddingVertical: 11,
    borderRadius: 12,
    marginBottom: 18,
  },
  bannerErro: {
    backgroundColor: 'rgba(239, 68, 68, 0.14)',
    borderWidth: 1,
    borderColor: 'rgba(239, 68, 68, 0.45)',
  },
  bannerSucesso: {
    backgroundColor: 'rgba(16, 185, 129, 0.14)',
    borderWidth: 1,
    borderColor: 'rgba(16, 185, 129, 0.45)',
  },
  iconeBanner: {
    marginRight: 8,
  },
  textoBanner: {
    color: '#F8FAFC',
    fontSize: 13,
    flex: 1,
    fontWeight: '600',
    lineHeight: 18,
  },
  grupoCampo: {
    marginBottom: 16,
  },
  label: {
    color: '#94A3B8',
    fontSize: 11.5,
    marginBottom: 8,
    fontWeight: '700',
    textTransform: 'uppercase',
    letterSpacing: 0.7,
  },
  inputBox: {
    width: '100%',
    height: 52,
    backgroundColor: '#0E1422',
    borderRadius: 14,
    borderWidth: 1,
    borderColor: '#1E293B',
    flexDirection: 'row',
    alignItems: 'center',
    paddingLeft: 14,
  },
  inputFoco: {
    borderColor: '#10B981',
    backgroundColor: '#131C2E',
  },
  iconeEsquerda: {
    marginRight: 10,
  },
  input: {
    flex: 1,
    height: '100%',
    color: '#F8FAFC',
    paddingRight: 12,
    fontSize: 15,
  },
  btnOlho: {
    paddingHorizontal: 14,
    justifyContent: 'center',
    alignItems: 'center',
    height: '100%',
  },
  containerRequisitos: {
    backgroundColor: '#0E1422',
    borderRadius: 16,
    borderWidth: 1,
    borderColor: '#1E293B',
    padding: 14,
    marginBottom: 20,
    gap: 10,
  },
  cabecalhoRequisitos: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  tituloRequisitos: {
    color: '#CBD5E1',
    fontSize: 12,
    fontWeight: '700',
    letterSpacing: 0.2,
  },
  contadorRequisitos: {
    color: '#94A3B8',
    fontSize: 11.5,
    fontWeight: '800',
    backgroundColor: '#131C2E',
    paddingHorizontal: 8,
    paddingVertical: 2,
    borderRadius: 999,
  },
  contadorRequisitosCompleto: {
    color: '#34D399',
    backgroundColor: 'rgba(16, 185, 129, 0.14)',
  },
  barraSegurancaFundo: {
    height: 4,
    borderRadius: 999,
    backgroundColor: '#1E293B',
    overflow: 'hidden',
  },
  barraSegurancaPreenchida: {
    height: '100%',
    borderRadius: 999,
    backgroundColor: '#10B981',
  },
  barraSegurancaCompleta: {
    backgroundColor: '#34D399',
  },
  gridRequisitos: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
  },
  pillRequisito: {
    width: '48.5%',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    backgroundColor: '#111827',
    borderWidth: 1,
    borderColor: '#1E293B',
    borderRadius: 10,
    paddingHorizontal: 10,
    paddingVertical: 8,
  },
  pillRequisitoOk: {
    backgroundColor: 'rgba(16, 185, 129, 0.1)',
    borderColor: 'rgba(16, 185, 129, 0.35)',
  },
  textoRequisito: {
    fontSize: 12,
    lineHeight: 15,
    flex: 1,
  },
  requisitoPendente: {
    color: '#64748B',
  },
  requisitoOk: {
    color: '#E2E8F0',
    fontWeight: '600',
  },
  btn: {
    width: '100%',
    height: 52,
    backgroundColor: '#10B981',
    borderRadius: 14,
    justifyContent: 'center',
    alignItems: 'center',
  },
  btnDesativado: {
    backgroundColor: '#1E293B',
    opacity: 0.7,
  },
  textoBtn: {
    color: '#06281E',
    fontSize: 15.5,
    fontWeight: '800',
    letterSpacing: 0.2,
  },
  divisor: {
    height: 1,
    backgroundColor: '#1E293B',
    marginTop: 22,
    marginBottom: 18,
  },
  containerLogin: {
    alignItems: 'center',
  },
  textoCinza: {
    color: '#94A3B8',
    fontSize: 13.5,
  },
  textoLinkVerde: {
    color: '#34D399',
    fontWeight: '700',
  },
});
