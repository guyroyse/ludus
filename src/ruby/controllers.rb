require 'json'
require 'model'

module LoginUrlController
  def LoginUrlController.execute(requested_url, requested_path)
    retval = []
    return_url = LudusUrl.new(requested_url, requested_path)
    providers = OpenIdProviders.new(return_url.url) 
    providers.each do |provider|
      retval << provider.to_hash
    end
    retval.to_json    
  end
end