Feature: verificar a funcionalidade de movimentacoes

  Background:
  * url url
  * call read('classpath:examples/autorizacao/autorizacao.feature@AUTORIZACAO')
  * header Authorization = 'JWT ' + token
  * request movimentacao
  * def date = read('classpath:helpers.js')()
  * movimentacao.data_transacao = date
  * movimentacao.data_pagamento = date
  * def response = karate.call('classpath:examples/contas/contas.feature@INCLUIR_CONTA')
  * movimentacao.conta_id = response.id

  @INCLUIR_MOVIMENTACAO
  Scenario: deve incluir uma movimentacao
    Given path 'transacoes'
    When method post
    Then status 201
