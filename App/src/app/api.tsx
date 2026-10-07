import axios from 'axios';
import { Platform } from 'react-native';

const baseURL = Platform.select({
  ios: 'http://localhost/inseto-base/back_end/config/',
  android: 'http://10.51.7.227/inseto-base/back_end/config/', 
});

const api = axios.create({
  baseURL: baseURL,
  timeout: 10000,      
  headers: {
    'Content-Type': 'application/json',
  },
});

api.interceptors.request.use(
  (config) => {
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

api.interceptors.response.use(
  (response) => response,
  (error) => {
    console.error('API Error:', error.response || error.message);
    return Promise.reject(error);
  }
);

export default api;
