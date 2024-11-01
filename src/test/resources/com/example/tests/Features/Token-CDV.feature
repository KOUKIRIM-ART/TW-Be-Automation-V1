Feature: Get Access Token from Oauth2 for rule engine
  Background:
    * configure ssl = true

  Scenario:
    Given url  'https://api-rcc.be-ys.com/auth/realms/BCU_INT/protocol/openid-connect/token'
    And form field grant_type = 'client_credentials'
    And form field client_id = 'cdv-Back'
    And form field client_secret = 'XTyTwFL2lA8sWlzsoYopCISTgyiHqzXC'
    When method post
    Then status 200
    And def accessToken = response.access_token

