
Feature: [Rating][CPM] Calculer une garantie maladie redoutée prenant en compte le filtre d'ancienneté (ANCIANETé>6Mois)

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def req1 = read('../Data/Accostage-Rating-CPM/IVSQA-TC-198.json')
    * def req2 = read('../Data/Accostage-Rating-CPM/InputScoring-TC-198.json')





  Scenario: [Rating][CPM] Calculer une garantie maladie redoutée prenant en compte le filtre d'ancienneté (ANCIANETé>6Mois)
    Given url baseUrl_Rating
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response

    And match response.status == 'PRE_ENRICHED'
    * def ratingStatus = response.ratingStatus
    * assert (ratingStatus == 'TREATED') || (ratingStatus == 'WARNING')
    * def claims = $response.bundle.bundle.claims[?(@.metadata.data.ClaimType=='RC')]
    * print claims
    * def claimRC = claims[0]
    * print claimRC
    * def item = claimRC.items[0]

    #Période1
    * def finalCalculationPeriode1 = $item.adjudications[?(@.category.code=='FinalCalculation')].[?(@.period.start contains "2022-06-10")]
    * print finalCalculationPeriode1
    And assert finalCalculationPeriode1[0].quantity == 1
    And assert finalCalculationPeriode1[0].amount.amount == 17482.80
    And assert finalCalculationPeriode1[0].total == 17482.80
    * def D1 = $finalCalculationPeriode1[0].period.start
    * def startDate = D1.split("T")
    * def D2 = $finalCalculationPeriode1[0].period.end
    * def endDate = D2.split("T")
    And assert startDate[0] == "2022-06-10"
    And assert endDate[0] == "2022-06-10"
    #Get ruleIdentifier_rating
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