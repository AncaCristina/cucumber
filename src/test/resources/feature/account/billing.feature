@screen
Feature: As a Customer I can edit my billing address

  Scenario: Prerequisite login
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "admin"/"library"
    Then I should see an element with text "Log Out"
  
  Scenario: User has correct Billing Address
    Given I click on edit Billing Address
    Then field "Email Address" should have value "em_mihai@yahoo.com"
    And field "Phone" should have value "0746827609"
    
  Scenario: User can change zip code in Billing Address
    Given I type "10016" into "Zip" field
    When I click on input button with text "Save Address"
    Then I should see an element with text "Address changed successfully."
    And I should see an element with text "New York, NY 10016"
    
  Scenario: Prerequisite logout
    Then I click on link with text "Log Out"
    
    
  Scenario: Open Shipping Address
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "admin"/"library"
    And I click on edit Shipping Address
    Then I should see an element with text "Shipping Address"

  Scenario: Force logout
    Then I click on link with text "Log Out"
    
  Scenario: Open billing address
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "Anca"/"anca90"
    And I click on edit Billing Address
    Then I should see an element with text "Billing Address"

  Scenario: User can change phone in billing address
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "Anca"/"anca90"
    And I click on edit Billing Address
    And I type "0743212100" into "Phone" field
    And I click on input button with text "Save Address"
    Then I should see an element with text "Address changed successfully."

  Scenario: User can change address in shipping address
    Given I open url "http://www.fasttrackit.org/OnlineLibrary/shortcodes/my-account/"
    When I login using "Anca"/"anca90"
    And I click on edit Shipping Address
    And I type "plopilor" into "Address" field
    And I click on input button with text "Save Address"
    Then I should see an element with text "Address changed successfully."
    And I should see an element with text "plopilor"
    
    