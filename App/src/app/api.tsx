import axios from 'axios';
import Constants from 'expo-constants';
const PASTA_API = 'Projeto-app/connection/';
 
function pegarUrlBase(): string {
  try {
    const envUrl = process.env.EXPO_PUBLIC_API_URL?.trim();
    if (envUrl) {
      return envUrl.endsWith('/') ? envUrl : `${envUrl}/`;
    }
 
    const hostUri = Constants.expoConfig?.hostUri;
    if (hostUri) {
      const limpo = hostUri.replace(/^[a-zA-Z]+:\/\//, '');
      const ip = limpo.split(':')[0];
      if (ip) {
        return `http://${ip}/${PASTA_API}`;
      }
    }
  } catch {

  }
 
  return `http://127.0.0.1/${PASTA_API}`;
}
 
export const baseURL = pegarUrlBase();
 
if (__DEV__) {
  console.log('[API] baseURL =', baseURL);
}
 
export const api = axios.create({
  baseURL,
  timeout: 15000,
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
        Object.assign(new Error('Resposta não é JSON'), {
          naoEhJson: true,
          config: response.config,
          response,
        })
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
    return 'O servidor respondeu algo que não é JSON (provável erro PHP ou bloqueio da hospedagem).';
  }
  if (!error?.response) {
    return `Sem conexão com o servidor (${baseURL}). Confira a internet e se o servidor/túnel está ligado.`;
  }
  if (error.response.status === 404) {
    return `Endpoint não encontrado (404): ${error.config?.baseURL ?? ''}${error.config?.url ?? ''}`;
  }
  return error.response.data?.erro || padrao;
}
 
export default api;
