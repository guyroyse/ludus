Before do
  @browser = Browser.new(:resynchronize => true)
end

After do
  @browser.close
end