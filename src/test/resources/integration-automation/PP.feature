
Feature: Appel API création Personne Physique - uniquement Informations obligatoires renseignées

  Background:
    * configure ssl = true
    * def tokens = call read(token)
    * print token
    * def random13DigitNumber = function() { return '' + Math.floor(Math.random() * 9 + 1) + Math.floor(Math.random() * 1e12) }
    * def ninfo = random13DigitNumber()
    * print ninfo

    * def req1 = read('../Data/integration-automation/PP.json')
    * def fun1 = function(){ req1.naturalPersons.payload.ninInfo.nin = ninfo  }
    * def fun2 = function(){ req1.naturalPersons.payload.personExternalId = 'PP-' + ninfo }
    * eval karate.forEach(req1, fun1)
    * eval karate.forEach(req1, fun2)
    * print req1

  Scenario:Appel API création Personne Physique - uniquement Informations obligatoires renseignées
#    Given url  'https://be-hub-dev.ivs-hp.be-ys.com/api/natural-person'
#    And  header Authorization = 'Bearer ' + tokens.access_token
#    And request  req1
#    When method POST
#    Then status 200
#    And print response

    Given driver "https://desktop-front-dev.ivs-hp.be-ys.com/"
    And waitFor("//div[@class='logo logo-beys']")
    And driver.maximize()
    And def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    And sleep(1000)

    When input("//input[@id='username']", 'ngharbi-ext')
    And input("//input[@id='password']", 'cavgkr!kss065')
    And click("//input[@id='kc-login']")
    And waitFor("//div[@class='logo logo-beys']")
    And click("//input[@placeholder='Rechercher un ...']")
    And sleep(3000)
    And input("//input[@placeholder='Rechercher un ...']", ninfo)
    And sleep(3000)
    And click("//button[@class='btn btn-secondary btn-i']")
    And sleep(3000)
    And click("//div[@class='search-item mb-4']")

    And waitFor("//h3[text()=' M. Integration Accostage ']")
    And waitFor("//p[text()='12/06/1980']")
    And waitFor("//p[text()='1 86 06 11 934 777 ']")
    And click("//span[text()='Afficher toutes les informations']")
    And waitFor("//p[text()='Accostage']")

    And sleep(3000)


