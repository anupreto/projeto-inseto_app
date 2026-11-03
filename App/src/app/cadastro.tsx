import { 
  View, 
  Text, 
  TextInput, 
  TouchableOpacity, 
  StyleSheet, 
  KeyboardAvoidingView,
  Platform,
  ScrollView,
  ActivityIndicator
} from 'react-native'
import React, { useState } from 'react'
import { router } from 'expo-router'
import { Ionicons } from '@expo/vector-icons'
import api from './api' 

export default function TelaCadastro() {
  const [novoEmail, setNovoEmail] = useState('')
  const [novaSenha, setNovaSenha] = useState('')
  const [focoEmail, setFocoEmail] = useState(false)
  const [focoSenha, setFocoSenha] = useState(false)
  const [ocultarSenha, setOcultarSenha] = useState(true)
  const [carregando, setCarregando] = useState(false)
  const [mensagemFeedback, setMensagemFeedback] = useState<{ tipo: 'erro' | 'sucesso', texto: string } | null>(null)
  
  const tamanhoOk = novaSenha.length >= 8
  const temMaiuscula = /[A-Z]/.test(novaSenha)
  const temMinuscula = /[a-z]/.test(novaSenha)
  const temNumero = /[0-9]/.test(novaSenha)
  
  const senhaAlfanumericaValida = tamanhoOk && temMaiuscula && temMinuscula && temNumero

  async function lidarComCadastro() {
    setMensagemFeedback(null) 

    if (!novoEmail.trim() || !novaSenha.trim()) {
      setMensagemFeedback({ tipo: 'erro', texto: 'Por favor, preencha todos os campos.' })
      return
    }

    if (!novoEmail.includes('@')) {
      setMensagemFeedback({ tipo: 'erro', texto: 'Por favor, insira um endereço de e-mail válido.' })
      return
    }

    if (!senhaAlfanumericaValida) {
      setMensagemFeedback({ tipo: 'erro', texto: 'A sua senha não cumpre os requisitos alfanuméricos obrigatórios.' })
      return
    }

    try {
      setCarregando(true)

      const resposta = await api.post('cadastro.php', {
        email: novoEmail,
        senha: novaSenha
      })

      if (resposta.data.sucesso) {
        setMensagemFeedback({ tipo: 'sucesso', texto: 'Conta criada com sucesso! Entrando...' })
        setTimeout(() => {
          router.replace('/home')
        }, 1200)
      }
    } catch (error: any) {
      const mensagemErro = error.response?.data?.erro || 'Não foi possível realizar o cadastro. Tente novamente.'
      setMensagemFeedback({ tipo: 'erro', texto: mensagemErro })
    } finally {
      setCarregando(false)
    }
  }

  return (
    <KeyboardAvoidingView 
      style={{ flex: 1, backgroundColor: '#0F172A' }} 
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
    >
      <ScrollView 
        contentContainerStyle={{ flexGrow: 1, justifyContent: 'center', alignItems: 'center', paddingVertical: 24 }} 
        showsVerticalScrollIndicator={false}
        keyboardShouldPersistTaps="handled"
      >
        <View style={a.login}>
            <Text style={a.tituloTela}>Criar Nova Conta</Text>

            {mensagemFeedback && (
              <View style={[
                a.bannerFeedback, 
                mensagemFeedback.tipo === 'sucesso' ? a.bannerSucesso : a.bannerErro
              ]}>
                <Ionicons 
                  name={mensagemFeedback.tipo === 'sucesso' ? "checkmark-circle" : "alert-circle"} 
                  size={20} 
                  color="#FFFFFF" 
                  style={{ marginRight: 8 }}
                />
                <Text style={a.textoFeedback}>{mensagemFeedback.texto}</Text>
              </View>
            )}

            <Text style={a.label}>E-mail</Text>
            <View style={[a.inputContainer, focoEmail && a.inputEmFoco]}>
              <TextInput 
                style={a.input} 
                placeholder="Digite seu melhor e-mail" 
                placeholderTextColor="#64748B" 
                keyboardType="email-address"
                autoCapitalize="none"
                autoCorrect={false}
                value={novoEmail} 
                onChangeText={setNovoEmail}
                onFocus={() => setFocoEmail(true)}
                onBlur={() => setFocoEmail(false)}
              />
            </View>

            <Text style={a.label}>Senha</Text>
            <View style={[a.inputContainer, focoSenha && a.inputEmFoco, a.inputSenhaRow]}>
              <TextInput 
                style={a.input} 
                placeholder="Crie uma senha forte" 
                placeholderTextColor="#64748B" 
                secureTextEntry={ocultarSenha} 
                autoCapitalize="none"
                value={novaSenha} 
                onChangeText={setNovaSenha}
                onFocus={() => setFocoSenha(true)}
                onBlur={() => setFocoSenha(false)}
              />
              
              <TouchableOpacity style={a.btnOlho} onPress={() => setOcultarSenha(!ocultarSenha)} activeOpacity={0.6}>
                <Ionicons name={ocultarSenha ? "eye-off-outline" : "eye-outline"} size={22} color="#94A3B8" />
              </TouchableOpacity>
            </View>

            <View style={a.containerRequisitos}>
              <Text style={a.tituloRequisitos}>A senha deve ser alfanumérica contendo:</Text>
              
              <View style={a.linhaRequisito}>
                <Ionicons 
                  name={tamanhoOk ? "checkmark-circle" : "ellipse-outline"} 
                  size={16} 
                  color={tamanhoOk ? "#10B981" : "#64748B"} 
                />
                <Text style={[a.textoRequisito, tamanhoOk ? a.requisitoOk : a.requisitoPendente]}>
                  No mínimo 8 caracteres
                </Text>
              </View>
              
              <View style={a.linhaRequisito}>
                <Ionicons 
                  name={temMaiuscula ? "checkmark-circle" : "ellipse-outline"} 
                  size={16} 
                  color={temMaiuscula ? "#10B981" : "#64748B"} 
                />
                <Text style={[a.textoRequisito, temMaiuscula ? a.requisitoOk : a.requisitoPendente]}>
                  Pelo menos uma letra maiúscula (A-Z)
                </Text>
              </View>
              
              <View style={a.linhaRequisito}>
                <Ionicons 
                  name={temMinuscula ? "checkmark-circle" : "ellipse-outline"} 
                  size={16} 
                  color={temMinuscula ? "#10B981" : "#64748B"} 
                />
                <Text style={[a.textoRequisito, temMinuscula ? a.requisitoOk : a.requisitoPendente]}>
                  Pelo menos uma letra minúscula (a-z)
                </Text>
              </View>
              
              <View style={a.linhaRequisito}>
                <Ionicons 
                  name={temNumero ? "checkmark-circle" : "ellipse-outline"} 
                  size={16} 
                  color={temNumero ? "#10B981" : "#64748B"} 
                />
                <Text style={[a.textoRequisito, temNumero ? a.requisitoOk : a.requisitoPendente]}>
                  Pelo menos um número (0-9)
                </Text>
              </View>
            </View>

            <TouchableOpacity 
              style={[
                a.btn, 
                carregando && a.btnDesativado
              ]} 
              activeOpacity={0.7} 
              onPress={lidarComCadastro} 
              disabled={carregando}
            >
              {carregando ? (
                <ActivityIndicator color="#FFFFFF" size="small" />
              ) : (
                <Text style={a.text_btn}>Cadastrar e Entrar</Text>
              )}
            </TouchableOpacity>
        </View>
      </ScrollView>
    </KeyboardAvoidingView>
  )
}

const a = StyleSheet.create({
  corpo: { flex: 1, backgroundColor: '#0F172A' },
  scrollContainer: { flexGrow: 1, justifyContent: 'center', alignItems: 'center', paddingVertical: 24 },
  login: { backgroundColor: '#1E293B', width: '88%', maxWidth: 400, padding: 24, borderRadius: 12, elevation: 4, shadowColor: '#000', shadowOffset: { width: 0, height: 2 }, shadowOpacity: 0.1, shadowRadius: 4 },
  tituloTela: { color: '#ffffff', fontSize: 20, fontWeight: 'bold', textAlign: 'center', marginBottom: 24 },
  bannerFeedback: { flexDirection: 'row', alignItems: 'center', padding: 12, borderRadius: 8, marginBottom: 16 },
  bannerErro: { backgroundColor: 'rgba(239, 68, 68, 0.15)', borderWidth: 1, borderColor: '#EF4444' },
  bannerSucesso: { backgroundColor: 'rgba(16, 185, 129, 0.15)', borderWidth: 1, borderColor: '#10B981' },
  textoFeedback: { color: '#F8FAFC', fontSize: 13, flex: 1, fontWeight: '500' },
  label: { color: '#94A3B8', fontSize: 12, marginBottom: 8, fontWeight: '700', textTransform: 'uppercase', letterSpacing: 0.8 },
  inputContainer: { width: '100%', height: 50, backgroundColor: '#334155', borderRadius: 8, marginBottom: 16, borderWidth: 1, borderColor: 'transparent' },
  inputSenhaRow: { flexDirection: 'row', alignItems: 'center' },
  inputEmFoco: { borderColor: '#10B981' }, 
  input: { flex: 1, color: '#F8FAFC', paddingHorizontal: 16, fontSize: 16 },
  btnOlho: { paddingHorizontal: 14, justifyContent: 'center', alignItems: 'center', height: '100%' },
  containerRequisitos: { marginBottom: 24 },
  tituloRequisitos: { color: '#94A3B8', fontSize: 13, fontWeight: '600', marginBottom: 10 },
  linhaRequisito: { flexDirection: 'row', alignItems: 'center', marginBottom: 8 },
  textoRequisito: { fontSize: 13, marginLeft: 10, lineHeight: 16 },
  requisitoPendente: { color: '#64748B' },
  requisitoOk: { color: '#10B981', fontWeight: '500' },
  btn: { width: '100%', height: 52, backgroundColor: '#10B981', borderRadius: 8, justifyContent: 'center', alignItems: 'center' },
  btnDesativado: { backgroundColor: '#334155', opacity: 0.5 }, 
  text_btn: { color: '#ffffff', fontSize: 16, fontWeight: 'bold' }
})