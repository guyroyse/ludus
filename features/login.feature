Feature: Login

  Scenario: User sees correct OpenID providers on the Welcome Page
    Given I am signed out
  	  And I have navigated to the Welcome Page 
    Then I should see the Sign In Panel
      And I should see a sign in logo for the following providers:
        | Name     | Image              |
        | Google   | google.png         |
        | Yahoo!   | yahoo.png          |
        | MySpace  | logo_muspace_s.gif |
        | AOL      | aol.png            |
        | MyOpenID | myopenid.png       |

  Scenario: User can login using OpenID
    Given I am signed out
  	  And I have navigated to the Welcome Page
    When I click the sign in logo for Google
    Then I should see the Login Page
    When I enter an email of test@hardboiledgeek.com
      And I click Log In
    Then I should see the Lobby Page
    
  Scenario: Logged in user on Welcome Page see Welcome Back Panel
    Given I am signed in
  	  And I have navigated to the Welcome Page 
    Then I should see the Welcome Back Panel
      And I should see the nickname test@hardboiledgeek.com on the Welcome Page
      
  Scenario: Logged in user on Welcome Page can sign out
    Given I am signed in
  	  And I have navigated to the Welcome Page 
  	When I click Sign Out
    Then I should see the Sign In Panel

  Scenario: Logged in user on Welcome Page can enter site
    Given I am signed in
  	  And I have navigated to the Welcome Page 
  	When I click Enter
    Then I should see the Lobby Page
    