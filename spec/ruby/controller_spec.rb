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
  
  it "redirects login required request to welcome page if user is not logged in" do
    stub_logged_out_current_user
    LoginController.new.login_required_redirect(HOME_URL, LOBBY_URL).should == HOME_URL
  end

  it "redirects login required request to lobby page if user is logged in" do
    stub_logged_in_current_user
    LoginController.new.login_required_redirect(HOME_URL, LOBBY_URL).should == LOBBY_URL    
  end
  
end

describe UserController do
  
  it 'returns a login status of false when user is not logged in' do
    stub_logged_out_current_user
    UserController.new.current_user.should == '{"loggedIn":false}'
  end
  
  it 'returns json containining a login status of true and the users nickname when user is logged in' do
    stub_logged_in_current_user
    UserController.new.current_user.should == %Q/{"loggedIn":true,"name":"#{USER_NICKNAME}"}/    
  end
  
end
