require 'adapters'

class LogoutUrl
  attr_reader :url
  def initialize(destination_url)
    @url = LoginUrlAdapter.new.get_logout_url(destination_url)
  end
end