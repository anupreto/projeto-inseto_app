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

export default function TelaLogin() {
  const [email, setEmail] = useState('')
  const [senha, setSenha] = useState('')
  
  const [focoEmail, setFocoEmail] = useState(false)
  const [focoSenha, setFocoSenha] = useState(false)
  const [ocultarSenha, setOcultarSenha] = useState(true)
  const [carregando, setCarregando] = useState(false)
  
  const [mensagemFeedback, setMensagemFeedback] = useState<{ tipo: 'erro' | 'sucesso', texto: string } | null>(null)

  const emailEstruturaValida = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim())

  async function lidarComLogin() {
    setMensagemFeedback(null)

    if (!email.trim() || !senha.trim()) {
      setMensagemFeedback({ tipo: 'erro', texto: 'Por favor, preencha o e-mail e a senha.' })
      return
    }

    if (!emailEstruturaValida) {
      setMensagemFeedback({ tipo: 'erro', texto: 'Insira um formato de e-mail válido.' })
      return
    }

    try {
      setCarregando(true)

      const resposta = await api.post('login.php', {
        email: email,
        senha: senha
      })

      if (resposta.data.sucesso) {
        setMensagemFeedback({ tipo: 'sucesso', texto: 'Login efetuado com sucesso! Entrando...' })
        setTimeout(() => {
          router.replace('/home') 
        }, 1200)
      }
    } catch (error: any) {
      const mensagemErro = error.response?.data?.erro || 'E-mail ou senha incorretos.'
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
            <Text style={a.tituloTela}>Entrar na Wiki</Text>

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
            <View style={[
              a.inputContainer, 
              focoEmail && a.inputEmFoco,
              (!emailEstruturaValida && email.length > 0 && !focoEmail) && a.inputErro
            ]}>
              <TextInput 
                style={a.input} 
                placeholder="exemplo@email.com" 
                placeholderTextColor="#64748B" 
                keyboardType="email-address"
                autoCapitalize="none"
                autoCorrect={false}
                value={email} 
                onChangeText={setEmail}
                onFocus={() => setFocoEmail(true)}
                onBlur={() => setFocoEmail(false)}
              />
            </View>
            
            <Text style={a.label}>Senha</Text>
            <View style={[a.inputContainer, focoSenha && a.inputEmFoco, a.inputSenhaRow]}>
              <TextInput 
                style={a.input} 
                placeholder="Sua senha" 
                placeholderTextColor="#64748B" 
                secureTextEntry={ocultarSenha} 
                autoCapitalize="none"
                value={senha} 
                onChangeText={setSenha}
                onFocus={() => setFocoSenha(true)}
                onBlur={() => setFocoSenha(false)}
              />
              
              <TouchableOpacity style={a.btnOlho} onPress={() => setOcultarSenha(!ocultarSenha)} activeOpacity={0.6}>
                <Ionicons name={ocultarSenha ? "eye-off-outline" : "eye-outline"} size={22} color="#94A3B8" />
              </TouchableOpacity>
            </View>

            <TouchableOpacity 
              style={[a.btn, carregando && a.btnDesativado]} 
              activeOpacity={0.7} 
              onPress={lidarComLogin} 
              disabled={carregando}
            >
              {carregando ? (
                <ActivityIndicator color="#FFFFFF" size="small" />
              ) : (
                <Text style={a.text_btn}>Entrar</Text>
              )}
            </TouchableOpacity>

            <TouchableOpacity style={a.containerCadastro} activeOpacity={0.6} onPress={() => router.push('/cadastro')}>
              <Text style={a.textoCinza}>Não tem uma conta? <Text style={a.textoLinkVerde}>Cadastre-se</Text></Text>
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
  inputErro: { borderColor: '#EF4444' },
  input: { flex: 1, color: '#F8FAFC', paddingHorizontal: 16, fontSize: 16 },
  btnOlho: { paddingHorizontal: 14, justifyContent: 'center', alignItems: 'center', height: '100%' },
  btn: { width: '100%', height: 52, backgroundColor: '#10B981', borderRadius: 8, justifyContent: 'center', alignItems: 'center', marginTop: 10 },
  btnDesativado: { backgroundColor: '#334155', opacity: 0.5 }, 
  text_btn: { color: '#ffffff', fontSize: 16, fontWeight: 'bold' },
  containerCadastro: { marginTop: 24, alignItems: 'center' },
  textoCinza: { color: '#94A3B8', fontSize: 14 },
  textoLinkVerde: { color: '#10B981', fontWeight: '600' }
})