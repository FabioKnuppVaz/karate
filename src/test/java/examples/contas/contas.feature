Feature: verificar a funcionalidade de contas

  Background:
  * url url
  * call read('classpath:examples/autorizacao/autorizacao.feature@AUTORIZACAO')
  * header Authorization = 'JWT ' + token

  @INCLUIR_CONTA
  Scenario: deve incluir uma conta
    Given path 'contas'
    And request contaTeste
    When method post
    Then status 201

    * string id = response.id
    * match id == '#regex \\d{7}'
    * match response.nome == '#regex Conta \\d{13}'
    * assert response.visivel == true
    * assert response.usuario_id == 1422

  @ALTERAR_CONTA
  Scenario: deve alterar uma conta
    * def response = karate.call('@INCLUIR_CONTA')
    Given path 'contas', response.id
    And request contaAlterada
    When method put
    Then status 200

    * string id = response.id
    * match id == '#regex \\d{7}'
    * match response.nome == '#regex Conta alterada \\d{13}'
    * assert response.visivel == true
    * assert response.usuario_id == 1422