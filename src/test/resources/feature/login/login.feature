@screen
Feature: Customer I can login to web site

  Scenario: Fail login detailed using email
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/"
    When I click on link with text "Log In"
    And I type "no@login.eu" into "Username or email address" field
    And I click on fake Password field
    And I type "badpass" into "Password" field
    And I click on input button with text "Login"
    Then I should see an element with text " A user could not be found with this email address."
  
  Scenario: failed login using username
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "wronguser"/"pass"
    Then I should see following elements with texts ": Invalid username. ,Lost your password"
    
  Scenario: Password is required
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "wronguser"/""
    Then I should see following elements with texts " Password is required."

  Scenario: Fail login
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/"
    When I click on Login button from top navigation menu
    And I login using "no@login.eu"/"badpass"
    Then login should fail


  Scenario: Successfully login detailed
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/"
    When I click on link with text "Log In"
    And I type "admin" into "Username or email address" field
    And I click on fake Password field
    And I type "library" into "Password" field
    And I click on input button with text "Login"
    Then I should see an element with text "Log Out"
    And I should see following elements with texts "Recent Orders, My Addresses, Billing Address, Shipping Address"
    And I click on link with text "Log Out"
    
  Scenario: Successfully login
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "admin"/"library"

  Scenario: Force logout
    Then I click on link with text "Log Out"


  Scenario: Fail login using invalid email and incorrect password
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "mihaela@yahoo.com"/"abcde"
    Then I should see an element with text " A user could not be found with this email address."

  Scenario: Fail login using invalid username and correct password
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "flaviu"/"anca90"
    Then I should see an element with text ": Invalid username. "

  Scenario: Fail login using invalid email and correct password
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "nicoleta@yahoo.com"/"anca90"
    Then I should see an element with text " A user could not be found with this email address."

  Scenario: Fail login using valid username and incorrect password
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/"
    When I click on link with text "Log In"
    And I type "Anca" into "Username or email address" field
    And I click on fake Password field
    And I type "123456" into "Password" field
    And I click on input button with text "Login"
    Then I should see an element with text ": The password you entered for the username "
    And I should see an element with text "Anca"
    And I should see an element with text " is incorrect. "

  Scenario: Fail login using empty Username or email address field
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/"
    When I click on link with text "Log In"
    And I click on fake Password field
    And I type "anca90" into "Password" field
    Then I should see an element with text "Username is required."

