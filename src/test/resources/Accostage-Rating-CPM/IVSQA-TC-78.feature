
Feature: [BCUMV-4145] - [Rating][Scoring] Plusieurs règles sont retournées en l'absence du filtre ancienneté
  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def req1 = read('../Data/Accostage-Rating-CPM/IVSQA-TC-78.json')
    * def req2 = read('../Data/Accostage-Rating-CPM/InputScoring1.json')

  Scenario:[BCUMV-4145] - [Rating][Scoring] Plusieurs règles sont retournées en l'absence du filtre ancienneté
    Given url baseUrl_Rating
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response
    And match response.status == 'PRE_ENRICHED'
    * def ratingStatus = response.ratingStatus
    * assert (ratingStatus == 'TREATED') || (ratingStatus == 'WARNING')
    * def rules = $response.steps.CPM_ENRICHMENT.itemSteps.1.apiResponseBody.rules
      And assert rules.length==4
    * def rulesIdentifier1 = $response.steps.CPM_ENRICHMENT.itemSteps.1.apiResponseBody.rules[0].ruleIdentifier
    * def rulesIdentifier2 = $response.steps.CPM_ENRICHMENT.itemSteps.1.apiResponseBody.rules[1].ruleIdentifier
    * def rulesIdentifier3 = $response.steps.CPM_ENRICHMENT.itemSteps.1.apiResponseBody.rules[2].ruleIdentifier
    * def rulesIdentifier4 = $response.steps.CPM_ENRICHMENT.itemSteps.1.apiResponseBody.rules[3].ruleIdentifier
    * print rulesIdentifier1
    * print rulesIdentifier2
    * print rulesIdentifier3
    * print rulesIdentifier4
    #verifier le retour scoring
    Given url urlScoringApi
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req2
    When method POST
    Then status 200
    And print response.rules
    * def rules_Scoring = $response.rules
    * print rules_Scoring
    And assert rules_Scoring.length==4
    * def rules_Scoring0 = $response.rules[0].ruleIdentifier
    * def rules_Scoring1 = $response.rules[1].ruleIdentifier
    * def rules_Scoring2 = $response.rules[2].ruleIdentifier
    * def rules_Scoring3 = $response.rules[3].ruleIdentifier
    And assert rules_Scoring0 ==rulesIdentifier1
    And assert rules_Scoring1 ==rulesIdentifier2
    And assert rules_Scoring2 ==rulesIdentifier3
    And assert rules_Scoring3 ==rulesIdentifier4
