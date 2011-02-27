Feature: Welcome

  Scenario: User sees the welcome page at default address
    When I navigate to the default address
    Then I should see the welcome page
    