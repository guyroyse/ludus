$LOAD_PATH << 'src/ruby'

require 'controllers'

describe LoginUrlController do
  
  REQUESTED_URL = 'http://example.com/foo'
  REQUESTED_PATH = '/foo'
  RETURN_URL = 'http://example.com/bar'
  PROVIDER_NAME = 'foo'
  PROVIDER_IMAGE = 'bar.png'
  PROVIDER_URL = 'http://example.com/baz'
  
  before do
    
    @controller = LoginUrlController.new
    
    def @controller.url_double=(double)
      @url_double = double
    end
    
    def @controller.url(requested_url, requested_path)
      @url_double
    end
    
    def @controller.providers_double=(double)
      @providers_double = double
    end
    
    def @controller.providers(url)
      @providers_double
    end
    
    @controller.url_double = stub('url', :url => RETURN_URL)
    
    provider_stub = stub('provider', :to_hash => { :name => PROVIDER_NAME, :image => PROVIDER_IMAGE, :url => PROVIDER_URL });
    providers_stub = stub('providers')
    providers_stub.should_receive(:each).and_yield(provider_stub)
    @controller.providers_double = providers_stub
      
  end
  
  it 'returns JSON containing expected provider URLs' do
    
    json = @controller.execute(REQUESTED_URL, REQUESTED_PATH)
    
    json.should == %Q/[{"name":"#{PROVIDER_NAME}","image":"#{PROVIDER_IMAGE}","url":"#{PROVIDER_URL}"}]/
    
  end
  
  it 'passes request correct URL data to LudusUrl' do

    def @controller.url(requested_url, requested_path)
      requested_url.should == REQUESTED_URL
      requested_path.should == REQUESTED_PATH
      @url_double
    end
    
    @controller.execute REQUESTED_URL, REQUESTED_PATH
        
  end
  
  it 'passed correct URL to OpenIdProviders' do
    
    def @controller.providers(url)
      url.should == RETURN_URL
      @providers_double
    end
    
    @controller.execute REQUESTED_URL, REQUESTED_PATH
    
  end
  
end