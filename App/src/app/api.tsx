import axios from 'axios';
import { Platform } from 'react-native';
import Constants from 'expo-constants';

const getDynamicIp = (): string => {
  const expoConfig = Constants.expoConfig as any;

  const hostUri = 
    expoConfig?.hostUri || 
    Constants.manifest2?.extra?.expoGo?.debuggerHost || 
    Constants.manifest?.debuggerHost;
  
  if (hostUri) {
    return hostUri.split(':')[0];
  }

  return Platform.OS === 'android' ? '10.0.2.2' : 'localhost';
};

const ip = getDynamicIp();
const baseURL = `http://${ip}/trabalho-app/connection/`;

export const api = axios.create({
  baseURL,
  timeout: 10000, 
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
});

api.interceptors.request.use(
  (config) => {
    return config;
  },
  (error) => Promise.reject(error)
);

api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (__DEV__) {
      console.warn('[API Error]', {
        url: error.config?.url,
        status: error.response?.status,
        mensagem: error.response?.data?.erro || error.message,
      });
    }
    return Promise.reject(error);
  }
);

export default api;