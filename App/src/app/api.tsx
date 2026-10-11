import axios from 'axios';
import { Platform } from 'react-native';
import Constants from 'expo-constants';

const getDynamicIp = () => {
  const expoConfigAny = Constants.expoConfig as any;
  const hostUri = expoConfigAny?.hostUri || Constants.manifest2?.extra?.expoGo?.debuggerHost;
  
  if (hostUri) {
    return hostUri.split(':')[0];
  }
  
  return Platform.OS === 'android' ? '10.0.2.2' : 'localhost';
};

const ip = getDynamicIp();

const baseURL = Platform.select({
  ios: `http://${ip}/trabalho-app/connection/conexao.php`,
  android: `http://${ip}/trabalho-app/connection/conexao.php`, 
});

const api = axios.create({
  baseURL: baseURL,
  timeout: 10000,      
  headers: {
    'Content-Type': 'application/json',
  },
});

api.interceptors.request.use(
  (config) => config,
  (error) => Promise.reject(error)
);

api.interceptors.response.use(
  (response) => response,
  (error) => {
    console.error('API Error:', error.response || error.message);
    return Promise.reject(error);
  }
);

export default api;