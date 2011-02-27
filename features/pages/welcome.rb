class WelcomePage
  def initialize(browser)
    @browser = browser
  end
  def visit
    @browser.goto "http://localhost:8888"
  end
  def contains_text(text)
    @browser.contains_text(text) != nil
  end
end