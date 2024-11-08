
Feature: IVSQA-TC-190: [CPM][NDM]Vérifiez l'API pour la récupération des catalogues relatifs aux rémunérations et primes DSN

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token


  Scenario: IVSQA-TC-190
    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/code:P0094"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    And print response
    * def label = $response.label
    And assert label == "Primes en DSN"

    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/66f411a234de8bc983f7291f"
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  { "contextId": "5c3627cb413a6b4788db9bcc" }
    When method POST
    Then status 200
    And print response
    * def data = $response.datas
    * print data
    And assert data != null
    * print data.length
    And assert data.length != 0


    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/code:P0095"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    And print response
    * def label = $response.label
    And assert label == "Rémunérations en DSN"


    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/66f2e0b75ed652cb323d65b4"
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  { "contextId": "5c3627cb413a6b4788db9bcc" }
    When method POST
    Then status 200
    And print response
    * def data = $response.datas
    * print data
    And assert data != null
    * print data.length
    And assert data.length != 0



