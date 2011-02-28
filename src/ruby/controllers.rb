require 'json'
require 'model'

module LoginUrlController
  def LoginUrlController.execute(requested_url, requested_path)
    retval = []
    providers = OpenIdProviders.new(requested_url.sub(/#{Regexp.escape(requested_path)}$/, '') + '/ludus.html') 
    providers.each do |provider|
      retval << provider.to_hash
    end
    retval.to_json    
  end
end