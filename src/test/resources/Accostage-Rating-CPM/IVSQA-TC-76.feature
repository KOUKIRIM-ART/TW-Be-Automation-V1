Feature: [BCUMV-4145] - [BCUMAN][Rating][Scoring] Application des règles de portabilité conventionnelle depuis BCUMAN

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    #    * def uuid = function(){ return java.util.UUID.randomUUID() + '' }
    #    * def myId1 = uuid()
    #    * print myId1
       * def req1 = read('../Data/Accostage-Rating-CPM/IVSQA-TC-76.json')
    #    * def req2 = read('../Data/Accostage-Rating-CPM/InputScoring.json')


  Scenario:[BCUMV-4145] - [BCUMAN][Rating][Scoring] Application des règles de portabilité conventionnelle depuis BCUMAN
    Given url urlBCUMAN
    And  header Authorization = 'Bearer ' + tokens.access_token
#    And request  req1
    When method POST
    Then status 200
    And print response
    * def regulationCode = $response[?(@.header.codeRegulation == "10307")]
    * print regulationCode
    * def regulationCode_Details = $regulationCode[0].detail
    * print regulationCode_Details
    * def value = $regulationCode_Details[?(@.characteristics.subType.type.code == "PORT_CONV")]
    * print  value
    * def value = $value[0].characteristics.value
    * print value
    And assert value ==31
#    retour rating
    Given url  baseUrl_Rating
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 200
    And print response
