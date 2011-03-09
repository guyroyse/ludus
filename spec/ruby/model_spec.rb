$LOAD_PATH << 'src/ruby'

require 'model'

RETURN_URL = 'http://example.com/ludus.html'
  
describe LudusUrl do
  
  REQUESTED_URL = 'http://example.com/foo'
  REQUESTED_PATH = '/foo'
  
  it 'returns the expect URL' do
    LudusUrl.new(REQUESTED_URL, REQUESTED_PATH).url.should == RETURN_URL
  end
  
end

describe OpenIdProvider do
  
  PROVIDER_NAME = 'foo'
  PROVIDER_IMAGE = 'bar.png'
  PROVIDER_URL = 'http://provider.example.com'
  OPENID_URL = 'http://openid.example.com'
  
  before do
    
    @provider = OpenIdProvider.new(PROVIDER_NAME, PROVIDER_IMAGE, OPENID_URL, RETURN_URL)
    
    def @provider.adapter_double=(double)
      @adapter_double = double
    end
    
    def @provider.adapter
      @adapter_double
    end

    @adapter_stub = stub('adapter');
    @provider.adapter_double = @adapter_stub
    
  end

  it 'returns a properly populated hash map' do
    @adapter_stub.should_receive(:get_login_url).and_return(PROVIDER_URL)
    @provider.to_hash.should == { :name => PROVIDER_NAME, :image => PROVIDER_IMAGE, :url => PROVIDER_URL }
  end
  
  it 'passes appropriate URLs to adapter' do
    @adapter_stub.should_receive(:get_login_url).with(RETURN_URL, OPENID_URL).and_return(PROVIDER_URL)
    @provider.to_hash
  end

end