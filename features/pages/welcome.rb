class WelcomePage
  def initialize(browser)
    @browser = browser
  end
  def visit
    @browser.goto "http://localhost:8888"
  end
  def contains_text?(text)
    @browser.contains_text(text) != nil
  end
  def sign_in_panel_visible?
    @browser.wait_until(60) do 
      @browser.div(:id, 'sign-in').visible? 
    end
    @browser.div(:id, 'sign-in').visible?
  end
  def contains_openid_provider?(provider)
    @browser.ul(:id, 'openid-providers').image(:alt, provider) != nil    
  end
end