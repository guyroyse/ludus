require 'java'

class OpenIdUrlAdapter
  def get_login_url(return_url, openid_url) 
    com.hardboiledgeek.ludus.service.LudusUserService.create_login_url return_url, openid_url
  end
end