require 'json'
require 'model'
require 'java'
 
java_import com.hardboiledgeek.ludus.service.LudusUserService

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
end