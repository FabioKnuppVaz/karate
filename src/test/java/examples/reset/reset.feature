Feature: verificar a funcionalidade de reset

  Background:
  * url url
  * call read('classpath:examples/autorizacao/autorizacao.feature@AUTORIZACAO')
  * header Authorization = 'JWT ' + token

  @RESET
  Scenario: deve resetar
    Given path 'reset'
    When method get
    Then status 200