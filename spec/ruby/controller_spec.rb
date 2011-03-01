$LOAD_PATH << 'src/ruby'

require 'controllers'

describe LoginUrlController do
  it 'returns JSON containing expected provider URLs' do
    
    REQUESTED_URL = 'http://example.com/foo'
    REQUESTED_PATH = '/foo'
    RETURN_URL = 'http://example.com/bar'
    PROVIDER_NAME = 'foo'
    PROVIDER_IMAGE = 'bar.png'
    PROVIDER_URL = 'http://example.com/baz'
    
    def LoginUrlController::mock_url=(mock)
      @mock_url = mock
    end
    def LoginUrlController::url(requested_url, requested_path)
      requested_url.should == REQUESTED_URL
      requested_path.should == REQUESTED_PATH
      @mock_url
    end
    
    def LoginUrlController::mock_providers=(mock)
      @mock_providers = mock
    end
    def LoginUrlController::providers(url)
      url.should == RETURN_URL
      @mock_providers
    end
    
    mock_url = mock('url')
    mock_url.should_receive(:url).once.and_return(RETURN_URL)
    LoginUrlController::mock_url = mock_url
    
    mock_provider = mock('provider')
    mock_provider.should_receive(:to_hash).once.and_return({ :name => PROVIDER_NAME, :image => PROVIDER_IMAGE, :url => PROVIDER_URL });
    mock_providers = mock('providers')
    mock_providers.should_receive(:each).once.and_yield(mock_provider)    
    LoginUrlController::mock_providers = mock_providers
      
    json = LoginUrlController.execute(REQUESTED_URL, REQUESTED_PATH)
    
    json.should == %Q/[{"name":"#{PROVIDER_NAME}","image":"#{PROVIDER_IMAGE}","url":"#{PROVIDER_URL}"}]/
  end
end