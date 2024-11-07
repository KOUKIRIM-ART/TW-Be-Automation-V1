
Feature:IVSQA-TC-175: [Rating - CPM ] Gérer les garanties frais généraux - Homme clé

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token

    * def req1 = read('../Data/Accostage-Rating-CPM/IVSQA-TC-175.json')
    * def req2 = read('../Data/Accostage-Rating-CPM/InputScoring-TC-175.json')





  Scenario: IVSQA-TC-175: [Rating - CPM ] Gérer les garanties frais généraux - Homme clé
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