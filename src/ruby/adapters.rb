require 'java'

java_import com.hardboiledgeek.ludus.service.LudusUserService

class OpenIdUrlAdapter
  def get_login_url(return_url, openid_url) 
    LudusUserService.create_login_url return_url, openid_url
  end
end