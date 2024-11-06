
Feature: [CPM][NDM]Vérifier la réponse de l'API pour les règles de portabilité conventionnelle.

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def req = read('../Data/Accostage-CPM-NDM/InputScoring-TC-199.json')





  Scenario:[CPM][NDM]Vérifier la réponse de l'API pour les règles de portabilité conventionnelle.
    Given url "https://referencial-dev.ivs-hp.be-ys.com/api/catalogs/code:P0083"
    And  header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    And print response
    * def label = $response.label
    And assert label == "Type de la portabilité"
    * def path = $response.path
    And assert path == "api/portabilityType"


    #verifier le retour scoring
    Given url urlScoringApi
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req
    When method POST
    Then status 200
    And print response
    * def filter_type_portability = $response.rules[0].benefit.filters[?(@.filterType.code == "TYPE_PORTA")]
    And print filter_type_portability
    * def portability_type = $filter_type_portability[0].listValues[0].code
    And assert portability_type == "LEGAL"

