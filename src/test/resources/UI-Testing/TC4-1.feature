Feature: Demo UI Testing

  Scenario:
    Given driver "https://desktop-front-dev.ivs-hp.be-ys.com/"
    And waitFor("//div[@class='logo logo-beys']")
    And driver.maximize()
    And def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    And sleep(1000)

    When input("//input[@id='username']", 'cbaudot')
    And input("//input[@id='password']", 'Pdmdp2021!')
    And click("//input[@id='kc-login']")
    And waitFor("//div[@class='logo logo-beys']")

    And sleep(3000)

#    Then waitFor("//span[text()='Camunda Cockpit']")
#    And click("//view//a[@href='#/processes']")
#    Then waitFor("//span[text()='Running Instances']")
#    And click("//a[contains(text(), 'GDD')]")
#    And sleep(1000)

    # Then match "//span[text()='Camunda Cockpit']"
