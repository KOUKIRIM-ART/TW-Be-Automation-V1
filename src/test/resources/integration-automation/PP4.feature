
Feature: Appel API création Personne Physique - Données obligatoires + coordonnées de contact  + coordonnées bancaires  + Lieu de naissance

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def req1 = read('../Data/integration-automation/PP4.json')





  Scenario: Appel API création Personne Physique - Données obligatoires + coordonnées de contact  + coordonnées bancaires + Lieu de naissance
    Given url  'https://be-hub-dev.ivs-hp.be-ys.com/api/natural-person'
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response


