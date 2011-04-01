require 'adapters'

class CurrentUser
  attr_reader :logged_in
  attr_reader :nickname
  def initialize
    user = UserServiceAdapter.new.get_current_user
    @logged_in = !user.nil?
    @nickname = user.nickname if @logged_in
  end
end