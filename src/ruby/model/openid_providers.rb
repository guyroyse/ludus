require 'adapters'

class OpenIdProviders  
  def initialize(return_url)
    @providers = []
    @providers << OpenIdProvider.new('Google', 'google.png', 'google.com/accounts/o8/id', return_url) 
    @providers << OpenIdProvider.new('Yahoo!', 'yahoo.png', 'yahoo.com', return_url)
    @providers << OpenIdProvider.new('MySpace', 'logo_myspace_s.gif', 'myspace.com', return_url)
    @providers << OpenIdProvider.new('AOL', 'aol.png', 'aol.com', return_url)
    @providers << OpenIdProvider.new('MyOpenID', 'myopenid.png', 'myopenid.com', return_url)
  end
  def each
    @providers.each do |provider|
      yield provider
    end
  end
end

class OpenIdProvider
  def initialize(name, image, openid_url, return_url)
    @name = name
    @image = image
    @openid_url = openid_url
    @return_url = return_url
  end
  def to_hash
    login_url = LoginUrlAdapter.new.get_login_url(@return_url, @openid_url)
    { :name => @name, :image => @image, :url => login_url } 
  end
end