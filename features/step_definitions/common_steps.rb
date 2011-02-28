Given /^I am signed in$/ do
  Given "I am signed in as test@hardboiledgeek.com"
end

Given /^I am signed in as (.*)$/ do |email|
  Given "I am signed out"
    And "I have navigated to the Welcome Page"
  When "I click the sign in logo for Google"
    And "I enter an email of #{email}"
    And "I click Log In"  
end

Given /^I am signed out$/ do
  @browser.close
  @browser.clear_cookies
end

Given /^I have navigated to the Welcome Page$/ do
  @home = WelcomePage.new(@browser)
  @home.visit
end
