require 'json'
require 'model'
 
class UserController
  def current_user 
    user = CurrentUser.new
    hash = { :loggedIn => user.logged_in }
    hash[:name] = user.nickname if user.logged_in
    hash.to_json
  end
end
