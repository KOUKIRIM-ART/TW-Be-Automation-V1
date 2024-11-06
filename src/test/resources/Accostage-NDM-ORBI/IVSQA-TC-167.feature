Feature: [NDM][ORBI] Vérifier le retour de l'API d'Orbi pour la suspension des paiements sur PP (create or update)

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print tokens

    * def req1 = read('../Data/Accostage-NDM-ORBI/IVSQA-TC-167.json')

  Scenario: [NDM][ORBI] Vérifier le retour de l'API d'Orbi pour la suspension des paiements sur PP (create or update)
    Given url URLOrbiApi1
    And header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    * def response1 = response
    * print  response1

    Given url URLOrbiApi2
    And header Authorization = 'Bearer ' + tokens.access_token
    When method POST
    And request  req1
    Then status 200
    * def response2 = response
    * print  response2

    # Comparer les objets
    And assert response1 == response2

  # Si vous comparez des champs spécifiques, utilisez cela :
  # * assert response1.someField == response2.someField
