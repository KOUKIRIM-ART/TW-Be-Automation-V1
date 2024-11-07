
Feature: IVSQA-TC-190: [CPM][NDM]Vérifiez l'API pour la récupération des catalogues relatifs aux rémunérations et primes DSN

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token

   # * def req = read('../Data/Accostage-CPM-NDM/InputScoring-TC-190.json')





  Scenario: IVSQA-TC-190
    Given url "https://referencial-rec.ivs-hp.be-ys.com/api/catalogs/code:P0094"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    And print response
    * def label = $response.label
    And assert label == "Primes en DSN"


    Given url "https://referencial-rec.ivs-hp.be-ys.com/api/catalogs/code:P0095"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    And print response
    * def label = $response.label
    And assert label == "Rémunérations en DSN"


    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/code:P0094"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    And request  { "contextId": "5c3627cb413a6b4788db9bcc" }
    Then status 200
    And print response

    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/code:P0095"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    And request  { "contextId": "5c3627cb413a6b4788db9bcc" }
    Then status 200
    And print response



