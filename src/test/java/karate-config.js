function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    url: "https://barrigarest.wcaquino.me:443",
    usuarioValido: {
      email: "fabio.knupp@gmail.com",
      senha: "knupp123"
    },
    contaTeste: {
      "nome": "Conta " + java.lang.System.currentTimeMillis()
    },
    contaAlterada: {
      "nome": "Conta alterada"
    },
    movimentacao: {
      "conta_id": "",
      "descricao": "Descricao",
      "envolvido": "Envolvido",
      "tipo": "REC",
      "data_transacao": "",
      "data_pagamento": "",
      "valor": "100.00",
      "status": true
    }
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}