import axios from 'axios';
import { Platform } from 'react-native';

const ip = '192.168.1.107'; 

const baseURL = Platform.OS === 'web'
  ? 'http://localhost/inseto-base/back_end/config/banco.php'
  : `http://${ip}/inseto-base/back_end/config/banco.php`;

const api = axios.create({
  baseURL,
});

export default api;