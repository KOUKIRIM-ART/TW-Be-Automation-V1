
Feature: IVSQA-TC-179

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    * def req = read('../Data/Accostage-SME/IVSQA-TC-179.json')


  Scenario: IVSQA-TC-179
    Given url "https://group-contracts-survenance-projector-dev.ivs-hp.be-ys.com/api/v2/diff"
    And  header Authorization = 'Bearer ' + tokens.access_token
    And request req
    When method POST
    Then status 200
    And print response
    * def status = $response.object.diffStatus
    And assert status == "UPDATE"

