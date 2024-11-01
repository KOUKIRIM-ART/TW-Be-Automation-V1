Feature:
  Background:
    * configure ssl = true
    * def tokens = call read('classpath:com/example/tests/Features/Token.feature@access_token')
    * def response = karate.response


  Scenario:
    Given url 'https://rating-backend-rec.ivs-hp.be-ys.com/pivot/realtime'
  # Replace with actual base URL
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + tokens.access_token

    #Define the request body
    * def guid = karate.get('guid')
    * print 'Guid:', guid
    * def benefId = guid
    * def prestation = guid
    * print 'benefId set to:', benefId
    * print 'prestation set to:', prestation
    And def requestBody =
      """

      """
  # Send the POST request
    When method POST
    When request requestBody
    * print 'Response Status:', response.status
    * print 'Response Body:', response
    #Then assert response.status == 200


