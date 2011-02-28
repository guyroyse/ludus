class LoginPage < Page
  def login
    @browser.button(:value, 'Log In').click
    LobbyPage.new(@browser)
  end
end
