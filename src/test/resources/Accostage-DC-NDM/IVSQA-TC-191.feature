
Feature: IVSQA-TC-191: [DC][NDM] Vérifiez la réponse de l'API pour récupérer le catalogue des Motifs de fin de justificatif décès

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token


  Scenario: IVSQA-TC-191: [DC][NDM] Vérifiez la réponse de l'API pour récupérer le catalogue des Motifs de fin de justificatif décès
    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/code:P0086"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    And print response
    * def label = $response.label
    And assert label == "Motifs de fin de justificatif décès"

    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/66c4bb6c07440154967eb6d0"
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  { "contextId": "5c3627cb413a6b4788db9bcc" }
    When method POST
    Then status 200
    And print response

    * def functionID = $response.functionalId
    And assert functionID == "DCFINJUSTIF"

    * def scope = $response.scope
    And assert scope == "REGIME_TARIFAIRE"

    * def data = $response.datas
    * print data
    And assert data != null
    * print data.length
    And assert data.length != 0

    * def item_ATHONNR = $response.datas[?(@.code == "ATHONNR")]
    * print item_ATHONNR
    * def label = $item_ATHONNR[0].label
    And assert label == "Attestation sur l\u2019honneur non reçue"

    * def item_JENQT = $response.datas[?(@.code == "JENQT")]
    * print item_JENQT
    * def label = $item_JENQT[0].label
    And assert label == "Justificatif enquête vie non reçu"

    * def item_JPNSREV = $response.datas[?(@.code == "JPNSREV")]
    * print item_JPNSREV
    * def label = $item_JPNSREV[0].label
    And assert label == "Justificatif pension de réversion non reçu"



