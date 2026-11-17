import axios from 'axios';

// URL de produção padrão na nuvem ou injetada via variável de ambiente do Expo
const PRODUCTION_URL = 'http://wikiinverto.up.railway.app/'; 

const getBaseUrl = (): string => {
  // @ts-ignore
  const envUrl = typeof process !== 'undefined' ? process.env.EXPO_PUBLIC_API_URL : undefined;
  if (envUrl) {
    return envUrl.endsWith('/') ? envUrl : `${envUrl}/`;
  }
  return PRODUCTION_URL;
};

export const baseURL = getBaseUrl();

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
    return `Sem conexão com o servidor (${baseURL}). Confira sua internet ou o status da hospedagem.`;
  }
  if (error.response.status === 404) {
    return `Endpoint não encontrado (404): ${error.config?.baseURL ?? ''}${error.config?.url ?? ''}.`;
  }
  return error.response.data?.erro || padrao;
}

export default api;
