When /^I navigate to the default address$/ do
  @home = WelcomePage.new(@browser)
  @home.visit
end

Then /^I should see the welcome page$/ do
  @home.contains_text('Welcome to Ludus').should == true
end