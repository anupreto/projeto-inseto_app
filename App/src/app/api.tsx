import axios from 'axios';
import { Platform } from 'react-native';
import Constants from 'expo-constants';

const PASTA_HTDOCS = 'Projeto-app';
const PORTA_APACHE = '';
const IP_MANUAL = ''; // Se precisar forçar um IP fixo local, coloque aqui ex: '192.168.1.15'
const URL_WEB_PRODUCAO = 'seu-backend.infinityfreeapp.com';

const getDynamicIp = (): string => {
  if (IP_MANUAL) return IP_MANUAL;

  if (Platform.OS === 'web') {
    // Na web, se estiver em desenvolvimento local, usa localhost ou o IP atual da página
    if (typeof window !== 'undefined' && window.location.hostname !== 'localhost') {
      return window.location.hostname;
    }
    return URL_WEB_PRODUCAO;
  }

  const expoConfig = Constants.expoConfig as any;
  const hostUri: string | undefined =
    expoConfig?.hostUri ||
    (Constants as any).manifest2?.extra?.expoGo?.debuggerHost ||
    (Constants as any).manifest?.debuggerHost;

  if (hostUri) {
    return hostUri.split(':')[0];
  }

  return Platform.OS === 'android' ? '10.0.2.2' : 'localhost';
};

const ip = getDynamicIp();

// Ajuste seguro: se for web em produção usa https, senão http limpo
const protocolo = Platform.OS === 'web' && ip === URL_WEB_PRODUCAO ? 'https://' : 'http://';

export const baseURL = Platform.OS === 'web'
  ? `${protocolo}${ip}/connection/`
  : `${protocolo}${ip}${PORTA_APACHE}/${PASTA_HTDOCS}/connection/`;

if (__DEV__) {
  console.log('[API] baseURL =', baseURL);
}

export const api = axios.create({
  baseURL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json',
    Accept: 'application/json',
  },
});

api.interceptors.response.use(
  (response) => {
    if (typeof response.data === 'string') {
      if (__DEV__) {
        console.warn('[API] Resposta NÃO é JSON:', response.config.url, response.data.slice(0, 300));
      }
      return Promise.reject(
        Object.assign(new Error('Resposta não é JSON'), { naoEhJson: true, config: response.config, response })
      );
    }
    return response;
  },
  (error) => {
    if (__DEV__) {
      console.warn('[API Error]', {
        urlCompleta: `${error.config?.baseURL ?? ''}${error.config?.url ?? ''}`,
        status: error.response?.status,
        mensagem: error.response?.data?.erro || error.message,
      });
    }
    return Promise.reject(error);
  }
);

export function mensagemDeErro(error: any, padrao: string): string {
  if (error?.naoEhJson) {
    return 'O servidor respondeu algo que não é JSON (provável warning/erro PHP). Veja os logs do servidor.';
  }
  if (!error?.response) {
    return `Sem conexão com o servidor (${baseURL}). Confira a internet ou o servidor PHP.`;
  }
  if (error.response.status === 404) {
    return `Endpoint não encontrado (404): ${error.config?.baseURL ?? ''}${error.config?.url ?? ''}.`;
  }
  return error.response.data?.erro || padrao;
}

export default api;