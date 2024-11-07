Feature: IVSQA-TC-167:[NDM][ORBI] Vérifier le retour de l'API d'Orbi pour la suspension des paiements sur PP (create or update)

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print tokens
    * def random13DigitNumber = function() { return '' + Math.floor(Math.random() * 9 + 1) + Math.floor(Math.random() * 1e12) }
    * def ninfo = random13DigitNumber()
    * print ninfo

    * def req1 = read('../Data/Accostage-NDM-ORBI/IVSQA-TC-167.json')
    * def fun1 = function(){ req1.ninInfo.nin = ninfo  }
    * def fun2 = function(){ req1.personExternalId = 'PP-' + ninfo }
    * eval karate.forEach(req1, fun1)
    * eval karate.forEach(req1, fun2)
    * print req1

  Scenario: IVSQA-TC-167
    Given url "https://referencial-rec.ivs-hp.be-ys.com/api/v2/catalogs/contextId:5c3627cb413a6b4788db9bcc/functionId:SUSPPAIMT"
    And header Authorization = 'Bearer ' + tokens.access_token
    When method GET
    Then status 200
    And print  response
    * def Detail = $response.detail[?(@.code == "ATTRIB")]
    * print Detail
    * def label = $Detail[0].label
    And assert label == "En attente RIB"

    #Create or update personne physique
    Given url "https://natural-persons-integration-rec.ivs-hp.be-ys.com/api/v1/natural-persons/create-or-update"
    And header Authorization = 'Bearer ' + tokens.access_token
    And request  req1
    When method POST
    Then status 201
    And print response
    * def personId = $response.personId

    * def url_Orbi_Get = 'https://protected-persons-survenance-projector-dev.ivs-hp.be-ys.com/api/v2/protected-persons/'+ personId
    * print url_Orbi_Get

    Given url url_Orbi_Get
    And header Authorization = 'Bearer ' + tokens.access_token
    When method GET
   # Then status 200
    And print response

    #must_complet
