$LOAD_PATH << 'src/ruby'

require 'controllers'

describe LoginController do
  
  it 'returns JSON containing expected provider URLs' do
    
    provider = stub('provider', :to_hash => { :name => PROVIDER_NAME, :image => PROVIDER_IMAGE, :url => PROVIDER_URL });
    providers = stub('providers')
    providers.should_receive(:each).and_yield(provider)
    OpenIdProviders.should_receive(:new).and_return(providers)

    json = LoginController.new.login_urls(REQUESTED_URL, REQUESTED_PATH, LUDUS_URL)
    
    json.should == %Q/[{"name":"#{PROVIDER_NAME}","image":"#{PROVIDER_IMAGE}","url":"#{PROVIDER_URL}"}]/
    
  end
  
  it 'returns JSON containing expected logout URL' do

    logout_url = stub('logout_url')
    logout_url.should_receive(:url).and_return(LOGOUT_URL)
    LogoutUrl.should_receive(:new).and_return(logout_url)
    
    json = LoginController.new.logout_url(HOME_URL)
    
    json.should == %Q/{"url":"#{LOGOUT_URL}"}/
    
  end

end