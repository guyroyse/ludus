require 'json'
require 'model'
 
class LoginController
  def login_urls(requested_url, requested_path, destination_url)
    retval = []
    return_url = LudusUrl.new(requested_url, requested_path, destination_url)
    providers = OpenIdProviders.new(return_url.url) 
    providers.each do |provider|
      retval << provider.to_hash
    end
    retval.to_json    
  end
  def logout_url(destination_url)
    url = LogoutUrl.new(destination_url).url
    { :url => url }.to_json
  end
  def login_required_redirect(home_url, lobby_url)
    if CurrentUser.new.logged_in
      lobby_url
    else
      home_url
    end 
  end
end