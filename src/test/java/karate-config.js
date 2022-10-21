function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    url: 'https://barrigarest.wcaquino.me:443',
    usuarioValido: {
      email: 'fabio.knupp@gmail.com',
      senha: 'knupp123'
    },
    contaTeste: {
      'nome': 'Conta ' + java.lang.System.currentTimeMillis()
    },
    contaAlterada: {
      'nome': 'Conta alterada'
    }
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}