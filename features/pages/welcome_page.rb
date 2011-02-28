class WelcomePage < Page
  def visit
    @browser.goto "http://localhost:8888"
  end
  def sign_in_panel_visible?
    @browser.div(:id, 'sign-in').visible?
  end
  def welcome_back_panel_visible?
    @browser.div(:id, 'welcome-back').visible?
  end
  def contains_openid_provider?(provider)
    providers = @browser.ul(:id, 'openid-providers')
    providers.image(:alt, provider[:name]) != nil && providers.image(:src, provider[:image]) != nil    
  end
  def click_openid_provider(provider)
    @browser.ul(:id, 'openid-providers').link(:id, provider).click
    LoginPage.new(@browser)
  end
  def logout
    @browser.link(:id, 'logout').click    
  end
  def enter
    @browser.link(:id, 'enter').click
    LobbyPage.new(@browser)  
  end
end
