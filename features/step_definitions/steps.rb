Given /^I am on the welcome page$/ do
  @home = WelcomePage.new(@browser)
  @home.visit
end

When /^I navigate to the default address$/ do
  @home = WelcomePage.new(@browser)
  @home.visit
end

Then /^I should see the welcome page$/ do
  @home.contains_text?('Welcome to Ludus').should == true
end

Given /^I am signed out$/ do
end

Then /^I should see the sign in panel$/ do
  @home.sign_in_panel_visible?.should == true
  @home.contains_text?('Sign In').should == true
end

Then /^I should see a sign in logo for (.*)$/ do |provider|
  @home.contains_openid_provider?(provider).should == true
end

When /^I click the Google logo$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the login form$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I enter a username of test@example\.com$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click Log In$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the lobby page$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am signed on$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I navigate to the welcome page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the welcome back panel$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the enter button$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the sign out button$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am signed in$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click sign out$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click enter$/ do
  pending # express the regexp above with the code you wish you had
end
