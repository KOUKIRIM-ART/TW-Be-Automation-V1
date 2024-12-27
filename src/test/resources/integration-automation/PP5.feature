
Feature:  Appel API création Personne Physique - Données obligatoires + coordonnées de contact (adresse, mail, tel) + coordonnées bancaires (IBAN, BIC) + Lieu de naissance (ville, dep, pays) AVEC controlKey ne correspondant pas au NIN
  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def req1 = read('../Data/integration-automation/PP5.json')





  Scenario: Appel API création Personne Physique - Données obligatoires + coordonnées de contact (adresse, mail, tel) + coordonnées bancaires (IBAN, BIC) + Lieu de naissance (ville, dep, pays) AVEC controlKey ne correspondant pas au NIN
    Given url  'https://be-hub-dev.ivs-hp.be-ys.com/api/natural-person'
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response


