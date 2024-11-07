
Feature: IVSQA-TC-178

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    * def req = read('../Data/Accostage-SME/IVSQA-TC-178.json')


  Scenario: IVSQA-TC-178
    Given url "https://bcu-man-back-dev.ivs-hp.be-ys.com/bcu-manager-back/transco-context-by-insurer"
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request req
    When method POST
    Then status 200
    And print response
    * def insurerId = $response.object.insurerId
    * print insurerId
    * def contextId = $response.object.contextId
    * print contextId
    And assert contextId != null
    And assert insurerId != null


