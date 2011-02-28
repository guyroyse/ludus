class Page
  def initialize(browser)
    @browser = browser
  end
  def contains_text?(text)
    @browser.contains_text(text) != nil
  end
  def set_field(field, value)
    @browser.text_field(:id, field).value = value
  end
end