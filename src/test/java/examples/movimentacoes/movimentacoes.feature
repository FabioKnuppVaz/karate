Feature: verificar a funcionalidade de movimentacoes

  Background:
  * url url
  * call read('classpath:examples/autorizacao/autorizacao.feature@AUTORIZACAO')
  * header Authorization = 'JWT ' + token

  @INCLUIR_MOVIMENTACAO
  Scenario: deve incluir uma movimentacao
    * def date = read('classpath:helpers/date.js')()
    * def response = karate.call('classpath:examples/contas/contas.feature@INCLUIR_CONTA')
    * def contaId = response.id
    * movimentacao.data_transacao = date
    * movimentacao.data_pagamento = date
    * movimentacao.conta_id = contaId
    Given path 'transacoes'
    And request movimentacao
    When method post
    Then status 201

    * string id = response.id
    * match id == '#regex \\d{7}'
    * assert response.descricao == 'Descricao'
    * assert response.envolvido == 'Envolvido'
    * assert response.observacao == null
    * assert response.tipo == 'REC'
    * match response.data_transacao == '#regex \\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z'
    * match response.data_pagamento == '#regex \\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z'
    * assert response.valor == '100.00'
    * assert response.status == true
    * assert response.conta_id == contaId
    * assert response.usuario_id == 1422
    * assert response.transferencia_id == null
    * assert response.parcelamento_id == null

  @REMOVER_MOVIMENTACAO
  Scenario: deve remover uma movimentacao
    * def response = karate.call('@INCLUIR_MOVIMENTACAO')
    Given path 'transacoes', response.id
    When method delete
    Then status 204