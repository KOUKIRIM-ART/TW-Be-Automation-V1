Feature: Demo UI Testing

  Scenario:
    Given driver "https://camunda-bpm-rec.ivs-hp.be-ys.com/camunda/app/cockpit/default/#/login"
    And waitFor("//input[@placeholder='Username']")
    And driver.maximize()
    And def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    And sleep(1000)

    When input("//input[@placeholder='Username']", 'demo')
    And input("//input[@placeholder='Password']", 'demo')
    And click("//button[text()='Log in']")

    Then waitFor("//span[text()='Camunda Cockpit']")
    And click("//view//a[@href='#/processes']")
    Then waitFor("//span[text()='Running Instances']")
    And click("//a[contains(text(), 'GDD')]")
    And sleep(3000)

  # Then match "//span[text()='Camunda Cockpit']"