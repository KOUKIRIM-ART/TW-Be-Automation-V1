Feature: [NDM][ORBI] Vérifier le retour de l'API d'Orbi pour la suspension des paiements sur PP (create or update)

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print tokens
    * def orbiApi1 = 'https://referencial-rec.ivs-hp.be-ys.com/api/v2/catalogs/contextId:5c3627cb413a6b4788db9bcc/functionId:SUSPPAIMT'
    * def orbiApi2 = 'https://referencial-rec.ivs-hp.be-ys.com/api/catalogs/code:P0089'
    * def req1 = read('../Data/Accostage-NDM-ORBI/IVSQA-TC-167.json')

  Scenario: [NDM][ORBI] Vérifier le retour de l'API d'Orbi pour la suspension des paiements sur PP (create or update)
    Given url orbiApi1
    And header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    * def response1 = response
    * print  response1

    Given url orbiApi2
    And header Authorization = 'Bearer ' + tokens.access_token
    When method POST
    And request  req1
    Then status 200
    * def response2 = response
    * print  response2

    # Comparer les objets
    * assert response1 == response2

  # Si vous comparez des champs spécifiques, utilisez cela :
  # * assert response1.someField == response2.someField
