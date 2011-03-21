$LOAD_PATH << 'src/ruby'

require 'adapters'
require 'java'

java_import com.hardboiledgeek.ludus.service.LudusUserService

describe LoginUrlAdapter do
  
  it 'returns the expected login URL' do
    LudusUserService.should_receive(:create_login_url).once.with(RETURN_URL, OPENID_URL).and_return(PROVIDER_URL) 
    LoginUrlAdapter.new.get_login_url(RETURN_URL, OPENID_URL).should == PROVIDER_URL
  end
  
  it 'returns the expected logout URL' do
    LudusUserService.should_receive(:create_logout_url).once.with(HOME_URL).and_return(LOGOUT_URL) 
    LoginUrlAdapter.new.get_logout_url(HOME_URL).should == LOGOUT_URL
  end
  
end