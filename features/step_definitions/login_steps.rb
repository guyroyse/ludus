When /^I click the sign in logo for (.*)$/ do |provider|
  @login = @home.click_openid_provider(provider)
end

When /^I enter an? (.*) of (.*)$/ do |field, value|
  @login.set_field field, value
end

When /^I click Log In$/ do
  @lobby = @login.login
end

When /^I click Sign Out$/ do
  @home.logout
end

When /^I click Enter$/ do
  @lobby = @home.enter
end

Then /^I should see the Sign In Panel$/ do
  @home.sign_in_panel_visible?.should == true
  @home.contains_text?('Sign In').should == true
end

Then /^I should see a sign in logo for the following providers:$/ do |table|
  table.hashes.each do |provider|
    @home.contains_openid_provider?(provider).should == true
  end
end

Then /^I should see the Welcome Back Panel$/ do
  @home.welcome_back_panel_visible?.should == true
  @home.contains_text?('Welcome Back').should == true
end

Then /^I should see the nickname (.*) on the Welcome Page$/ do |nickname|
  @home.contains_text?(nickname).should == true
end

Then /^I should see the Login Page/ do
  @login.contains_text?('Not logged in')
end

Then /^I should see the Lobby Page$/ do
  @lobby.contains_text?('Lobby').should == true
end