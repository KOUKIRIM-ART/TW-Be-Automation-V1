
Feature: [CPM][NDM]Vérifier la réponse de l'API pour les règles de portabilité légale et conventionnelle.

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
    * def authUrl = 'https://api-rcc.be-ys.com/auth/realms/BCU_INT/protocol/openid-connect/token'
    * def searchUrl = 'https://referencial-dev.ivs-hp.be-ys.com/api/filters/v2/search'





  Scenario:[CPM][NDM]Vérifier la réponse de l'API pour les règles de portabilité légale et conventionnelle.
    Given url baseUrl_Rating
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response
    And match response.status == 'PRE_ENRICHED'
    * def ratingStatus = response.ratingStatus
    * assert (ratingStatus == 'TREATED') || (ratingStatus == 'WARNING')

    #    verifier le retour scoring
    Given url authUrl
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  authUrl
    When method POST
    Then status 200
    * def authResponse = response
    * def accessToken = authResponse.access_token
    * print 'Access Token:', accessToken
    Given url searchUrl
    And header Authorization = 'Bearer ' + accessToken


    * def rulesIdentifier_Scoring = $response.rules[0].ruleIdentifier
    * print rulesIdentifier_Scoring

    And assert rulesIdentifier_Scoring == rulesIdentifier