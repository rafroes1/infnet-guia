import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
  stages: [
    { duration: '10s', target: 100 },  // sobe para 100 usuários em 10s
    { duration: '30s', target: 100 },  // mantém
    { duration: '10s', target: 0 },   // desacelera
  ],
};

export default function () {
  http.get('http://192.168.49.2:30080'); //alterar url para a que o service subir
  sleep(1);
}
