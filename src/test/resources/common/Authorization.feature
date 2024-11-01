Feature:  Retrieve keycloak access token for REST APIs Authentication

  Background:
    * configure ssl = true
    * def encodedContent = read('classpath:common/config.json')


  @access_token
  Scenario: Testing auth


    * def tokens = read(token)
    * url baseUrlVerify
    Given url baseUrlVerify
    And header Authorization = 'Bearer ' + encodedContent.token
    And method GET
    * def access_token =  responseStatus == 200 ? encodedContent.token :  karate.call('classpath:common/Token.feature').access_token
    * eval com.example.PropertyFileWriter.writeToPropertyFile(access_token, 10000)

  @id_benef
  Scenario: generate id benef
    Given url 'https://api-rcc.be-ys.com/auth/realms/BCU_INT/protocol/openid-connect/token'
    And form field username = 'ref-admin'
    And form field password = 'Almerys0'
    And form field client_id = 'preRating-back'
    And form field grant_type = 'client_credentials'
    And form field client_secret = '6yuPoGl42tgiN72vDcZjCefV3RulZKJW'
    When method POST
    Then status 200
    * def uuid = function(){ return ( java.util.UUID.randomUUID() + '__' +  java.lang.System.currentTimeMillis() ) }
    * def beneficiaryId = uuid()


  @access_token_bcuman
  Scenario: Testing auth bcuman
    Given url 'https://rec.client.almerys.com/auth/realms/BCU_INT/protocol/openid-connect/token'
    And form field username = 'user_admin_local_bcu_manager'
    And form field password = 'BCUmanager*01234'
    And form field client_id = 'bcumanager-front'
    And form field grant_type = 'password'
    And form field client_secret = '365833c5-7572-41aa-b5af-5f4ee0bf5155'
    When method POST
    Then status 200
    * def access_token = response.access_token


  @token_rci
  Scenario: Testing auth rci
    Given url 'https://rec.client.almerys.com/auth/realms/BCU_RCI/protocol/openid-connect/token'
    And form field client_id = 'preRating_back'
    And form field grant_type = 'client_credentials'
    And form field client_secret = 'c7de1ed4-f2ad-4ead-8b53-d929d35c03fb'
    When method POST
    Then status 200
    * def access_token = response.access_token

  @access_token_demo
  Scenario: Testing auth
    Given url 'https://rec.client.almerys.com/auth/realms/BCU_DEMO/protocol/openid-connect/token'
    And form field client_id = 'preRating-back'
    And form field grant_type = 'client_credentials'
    And form field client_secret = 'e1e18b2d-7a9f-4bb7-bb42-a53825aa64b8'
    When method POST
    Then status 200
    * def access_token = response.access_token


  @token_rcc
  Scenario: Testing auth rci
    Given url 'https://rec.client.almerys.com/auth/realms/BCU/protocol/openid-connect/token'
    And form field client_id = 'preRating_back'
    And form field grant_type = 'client_credentials'
    And form field client_secret = 'b52b762c-8f9c-4d0c-964d-9d2cce386d10'
    When method POST
    Then status 200
    * def access_token = response.access_token