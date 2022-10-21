Feature: verificar a funcionalidade de autorizacao

  Background:
    * url url
    * request usuarioValido

  @AUTORIZACAO
  Scenario: deve realizar autenticacao
    Given path 'signin'
    When method post
    Then status 200

    * assert response.id == 1422
    * assert response.nome == 'Fábio'
    * match response.token == '#regex \\w{36}\\.\\w{15}\\.\\w{43}'
    * def token = response.token