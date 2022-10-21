Feature: verificar a funcionalidade de contas

  Background:
  * url url
  * call read('classpath:examples/autorizacao/autorizacao.feature@AUTORIZACAO')
  * header Authorization = 'JWT ' + token
  * request contaTeste

  @INCLUIR_CONTA
  Scenario: deve incluir uma conta
    * call read('classpath:examples/reset/reset.feature@RESET')
    Given path 'contas'
    When method post
    Then status 201

    * string id = response.id
    * match id == '#regex \\d{7}'
    * assert response.nome == 'Conta para teste'
    * assert response.visivel == true
    * assert response.usuario_id == 1422

  @ALTERAR_CONTA
  Scenario: deve alterar uma conta
    * def response = karate.call('@INCLUIR_CONTA')
    Given path 'contas', response.id
    When method put
    Then status 200

    * string id = response.id
    * match id == '#regex \\d{7}'
    * assert response.nome == 'Conta para teste'
    * assert response.visivel == true
    * assert response.usuario_id == 1422