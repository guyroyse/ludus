$LOAD_PATH << 'src/ruby'

require 'controllers'

describe LoginUrlController do
  it 'returns JSON containing expected provider URLs' do
    def LoginUrlController::mock_url=(mock)
      @mock_url = mock
    end
    def LoginUrlController::url(requested_url, requested_path)
      requested_url.should == 'http://example.com/foo'
      requested_path.should == '/foo'
      @mock_url
    end
    mock_url = mock('url')
    mock_url.should_receive(:url).once.and_return('http://example.com/bar')
    LoginUrlController::mock_url = mock_url
    
    def LoginUrlController::mock_providers=(mock)
      @mock_providers = mock
    end
    def LoginUrlController::providers(url)
      url.should == 'http://example.com/bar'
      @mock_providers
    end
    mock_provider = mock('provider')
    mock_provider.should_receive(:to_hash).once.and_return({ :name => 'foo', :image => 'bar.png', :url => 'http://example.com/baz' });
    mock_providers = mock('providers')
    mock_providers.should_receive(:each).once.and_yield(mock_provider)    
    LoginUrlController::mock_providers = mock_providers  
    LoginUrlController.execute('http://example.com/foo', '/foo').should == '[{"name":"foo","image":"bar.png","url":"http://example.com/baz"}]'
  end
end