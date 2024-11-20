
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

    * def rulesIdentifier1 = $response.steps.CPM_ENRICHMENT.itemSteps.1.apiResponseBody.rules[0].ruleIdentifier
    * print rulesIdentifier1

    #verifier le retour scoring
    Given url urlScoringApi
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req2
    When method POST
    Then status 200
    And print response.rules
    * def rules_Scoring = $response.rules
    * print rules_Scoring

    * def rules_Scoring0 = $response.rules[0].ruleIdentifier

    And assert rules_Scoring0 ==rulesIdentifier1
