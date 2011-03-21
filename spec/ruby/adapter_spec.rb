$LOAD_PATH << 'src/ruby'

require 'adapters'
require 'java'

java_import com.hardboiledgeek.ludus.service.LudusUserService

describe OpenIdUrlAdapter do
  
  it 'returns the expected URL' do
    LudusUserService.should_receive(:create_login_url).once.with(RETURN_URL, OPENID_URL).and_return(PROVIDER_URL) 
    OpenIdUrlAdapter.new.get_login_url(RETURN_URL, OPENID_URL).should == PROVIDER_URL
  end
  
end