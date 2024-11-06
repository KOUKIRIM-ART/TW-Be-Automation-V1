
Feature: [Rating][CPM] Vérifier le retour de l'API concernant la revalorisation d'un salaire de référence.

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def req1 = read('../Data/Accostage-Rating-CPM/IVSQA-TC-150.json')
    * def req2 = read('../Data/Accostage-Rating-CPM/InputScoring-TC-150.json')





  Scenario: [Rating][CPM] Vérifier le retour de l'API concernant la revalorisation d'un salaire de référence.
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

    #VERIFY result group: SR_REVALO
    * def Sr_revalo = $item.adjudicationGroups[?(@.code == "SR-revalorise")].adjudications
    * print Sr_revalo
     #FinalCalculation
    * def FinalCalculation = $Sr_revalo[0].[?(@.category.code == "FinalCalculation")].[?(@.period.start contains "2019-08-02")]
    * print FinalCalculation
    * def D1 = $FinalCalculation[0].period.start
    * def startDate = D1.split("T");
    * def D2 = $FinalCalculation[0].period.end
    * def endDate = D2.split("T");
    And assert startDate[0] == "2019-08-02"
    And assert endDate[0] == "2019-10-31"
    And assert FinalCalculation[0].reason.code == "Niveau 1"
    And assert FinalCalculation[0].amount.amount == 4500.00
    And assert FinalCalculation[0].quantity == 91
    * def GlobalDetails =  FinalCalculation[0].amountDetails[0].globalDetails
    * print GlobalDetails
    And assert GlobalDetails.value == 4500.0000
    And assert GlobalDetails.firstValue == 4500.0000
     #Check Revaluation index
    * def revaluationIndexValues =  FinalCalculation[0].amountDetails[0].revaluationIndexValues
    * print revaluationIndexValues
    And assert revaluationIndexValues.i1 == 1.2588
    And assert revaluationIndexValues.in == 1.2588
    #FinalCalculation
    * def FinalCalculation = $Sr_revalo[0].[?(@.category.code == "FinalCalculation")].[?(@.period.start contains "2019-11-01")]
    * print FinalCalculation
    * def D1 = $FinalCalculation[0].period.start
    * def startDate = D1.split("T");
    * def D2 = $FinalCalculation[0].period.end
    * def endDate = D2.split("T");
    And assert startDate[0] == "2019-11-01"
    And assert endDate[0] == "2019-12-31"
    And assert FinalCalculation[0].reason.code == "Niveau 1"
    And assert FinalCalculation[0].amount.amount == 4500.57
    And assert FinalCalculation[0].quantity == 61
    * def GlobalDetails =  FinalCalculation[0].amountDetails[0].globalDetails
    * print GlobalDetails
    And assert GlobalDetails.value == 4500.5670
    And assert GlobalDetails.firstValue == 4500.0000
    #Check Revaluation index
    * def revaluationIndexValues =  FinalCalculation[0].amountDetails[0].revaluationIndexValues
    * print revaluationIndexValues
    And assert revaluationIndexValues.i1 == 1.2588
    And assert revaluationIndexValues.in == 1.2714

    #Verify group result: RESULT
    * def Gr_Result = $item.adjudicationGroups[?(@.code == "Résultat")].adjudications
    * print Gr_Result
     #FinalCalculation
    * def FinalCalculation = $Gr_Result[0].[?(@.category.code == "FinalCalculation")].[?(@.period.start contains "2019-08-02")]
    * print FinalCalculation
    * def D1 = $FinalCalculation[0].period.start
    * def startDate = D1.split("T");
    * def D2 = $FinalCalculation[0].period.end
    * def endDate = D2.split("T");
    And assert startDate[0] == "2019-08-02"
    And assert endDate[0] == "2019-10-31"
    And assert FinalCalculation[0].reason.code == "Niveau 1"
    And assert FinalCalculation[0].amount.amount == 4488.00
    And assert FinalCalculation[0].quantity == 91
    * def GlobalDetails =  FinalCalculation[0].amountDetails[0].globalDetails
    * print GlobalDetails
    And assert GlobalDetails.value == 4488.0000
    And assert GlobalDetails.firstValue == 4488.0000
     #Check Revaluation index
    * def revaluationIndexValues =  FinalCalculation[0].amountDetails[0].revaluationIndexValues
    * print revaluationIndexValues
    And assert revaluationIndexValues.i1 == 1.2588
    And assert revaluationIndexValues.in == 1.2588
    #FinalCalculation
    * def FinalCalculation = $Gr_Result[0].[?(@.category.code == "FinalCalculation")].[?(@.period.start contains "2019-11-01")]
    * print FinalCalculation
    * def D1 = $FinalCalculation[0].period.start
    * def startDate = D1.split("T");
    * def D2 = $FinalCalculation[0].period.end
    * def endDate = D2.split("T");
    And assert startDate[0] == "2019-11-01"
    And assert endDate[0] == "2019-12-31"
    And assert FinalCalculation[0].reason.code == "Niveau 1"
    And assert FinalCalculation[0].amount.amount == 4489.13
    And assert FinalCalculation[0].quantity == 61
    * def GlobalDetails =  FinalCalculation[0].amountDetails[0].globalDetails
    * print GlobalDetails
    And assert GlobalDetails.value == 4489.1326
    And assert GlobalDetails.firstValue == 4488.5670
    #Check Revaluation index
    * def revaluationIndexValues =  FinalCalculation[0].amountDetails[0].revaluationIndexValues
    * print revaluationIndexValues
    And assert revaluationIndexValues.i1 == 1.2588
    And assert revaluationIndexValues.in == 1.2714

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