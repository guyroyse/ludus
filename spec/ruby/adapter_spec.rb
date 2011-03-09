$LOAD_PATH << 'src/ruby'

require 'adapters'

describe OpenIdUrlAdapter do
  
  it 'returns the expected URL' do
    com.hardboiledgeek.ludus.service.LudusUserService.should_receive(:create_login_url).once.and_return(PROVIDER_URL) 
    OpenIdUrlAdapter.new.get_login_url(RETURN_URL, OPENID_URL).should == PROVIDER_URL
  end
  
end