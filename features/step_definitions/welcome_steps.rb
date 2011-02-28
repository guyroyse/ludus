Given /^I have navigated to the default address$/ do
  Given "I have navigated to the Welcome Page"
end

Then /^I should see the Welcome Page$/ do
  @home.contains_text?('Welcome to Ludus').should == true
end