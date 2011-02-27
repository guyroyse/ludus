Feature: Login

  Scenario: User sees five OpenID providers on the welcome page
  	Given I am on the welcome page
  	  And I am signed out 
    Then I should see the sign in panel
      And I should see a sign in logo for Google
      And I should see a sign in logo for Yahoo!
      And I should see a sign in logo for MySpace
      And I should see a sign in logo for AOL
      And I should see a sign in logo for MyOpenID

  Scenario: User can login using OpenID
    Given I am on the welcome page
  	  And I am signed out 
    When I click the Google logo
    Then I should see the login form
    When I enter a username of test@example.com
      And I click Log In
    Then I should see the lobby page
    
  Scenario: Logged in user on welcome page see welcome back panel
    Given I am signed on
    When I navigate to the welcome page
    Then I should see the welcome back panel
      And I should see the enter button  
      And I should see the sign out button
      
  Scenario: Logged in user on welcome page can sign out
  	Given I am on the welcome page
  	  And I am signed in
  	When I click sign out
    Then I should see the sign in panel

  Scenario: Logged in user on welcome page can enter site
  	Given I am on the welcome page
  	  And I am signed in
  	When I click enter
    Then I should see the lobby page
    