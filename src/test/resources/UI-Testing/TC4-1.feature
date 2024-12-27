Feature: Demo UI Testing

  Scenario:
    * def ninfo = '1860611934777'
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
    And waitFor("//p[text()= '"+ninfo+"']")
    And click("//span[text()='Afficher toutes les informations']")
    And waitFor("//p[text()='Accostage']")

    And sleep(3000)
#    Then waitFor("//span[text()='Camunda Cockpit']")
#    And click("//view//a[@href='#/processes']")
#    Then waitFor("//span[text()='Running Instances']")
#    And click("//a[contains(text(), 'GDD')]")
#    And sleep(1000)

    # Then match "//span[text()='Camunda Cockpit']"
  #1860611934777

