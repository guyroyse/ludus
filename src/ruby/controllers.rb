require 'json'
require 'model'

module LoginUrlController
  def LoginUrlController.execute(requested_url, requested_path)
    retval = []
    return_url = url(requested_url, requested_path)
    providers = providers(return_url.url) 
    providers.each do |provider|
      retval << provider.to_hash
    end
    retval.to_json    
  end
  def url(requested_url, requested_path)
    LudusUrl.new requested_url, requested_path
  end
  def providers(url)
    OpenIdProviders.new url
  end
end