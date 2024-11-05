
Feature: [NDM][ORBI] Vérifier le retour de l'API d'Orbi afin de mettre à jour les dictionnaires métier NDM pour la prévoyance individuelle

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def req1 = read('../Data/Accostage-Rating-CPM/IVSQA-TC-55.json')
    * def req2 = read('../Data/Accostage-Rating-CPM/InputScoring.json')





  Scenario:[NDM][ORBI] Vérifier le retour de l'API d'Orbi afin de mettre à jour les dictionnaires métier NDM pour la prévoyance individuelle.
    Given url baseUrl_Rating
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response
    And match response.status == 'PRE_ENRICHED'
    * def ratingStatus = response.ratingStatus
    * assert (ratingStatus == 'TREATED') || (ratingStatus == 'WARNING')
    * def rulesIdentifier = $response.steps.CPM_ENRICHMENT.itemSteps.1.apiResponseBody.rules[0].ruleIdentifier
    * print rulesIdentifier
    #    verifier le retour scoring
    Given url urlScoringApi
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req2
    When method POST
    Then status 200
    And print response



    * def rulesIdentifier_Scoring = $response.rules[0].ruleIdentifier
    * print rulesIdentifier_Scoring

    And assert rulesIdentifier_Scoring == rulesIdentifier