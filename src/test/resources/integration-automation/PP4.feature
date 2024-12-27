
Feature: Appel API création Personne Physique - Données obligatoires + coordonnées de contact  + coordonnées bancaires  + Lieu de naissance

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token

    * def random13DigitNumber = function() { return '' + Math.floor(Math.random() * 9 + 1) + Math.floor(Math.random() * 1e12) }
    * def ninfo = random13DigitNumber()
    * print ninfo

    * def req1 = read('../Data/integration-automation/PP4.json')
    * def fun1 = function(){ req1.ninInfo.nin = ninfo  }
    * def fun2 = function(){ req1.personExternalId = 'PP-' + ninfo }
    * eval karate.forEach(req1, fun1)
    * eval karate.forEach(req1, fun2)
    * print req1






  Scenario: Appel API création Personne Physique - Données obligatoires + coordonnées de contact  + coordonnées bancaires + Lieu de naissance
    Given url  'https://be-hub-dev.ivs-hp.be-ys.com/api/natural-person'
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response


