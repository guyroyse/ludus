require 'java'

java_import com.hardboiledgeek.ludus.service.LudusUserService

class UserServiceAdapter
  def get_login_url(return_url, openid_url) 
    LudusUserService.create_login_url return_url, openid_url
  end
  def get_logout_url(destination_url)
    LudusUserService.create_logout_url destination_url
  end
  def get_current_user
    LudusUserService.current_user
  end
end