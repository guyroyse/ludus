$LOAD_PATH << 'src/ruby'

require 'controllers'

describe LoginUrlController do
  
  it 'returns JSON containing expected provider URLs' do
    
    provider = stub('provider', :to_hash => { :name => PROVIDER_NAME, :image => PROVIDER_IMAGE, :url => PROVIDER_URL });
    providers = stub('providers')
    providers.should_receive(:each).and_yield(provider)
    OpenIdProviders.should_receive(:new).and_return(providers)

    json = LoginUrlController.new.execute(REQUESTED_URL, REQUESTED_PATH)
    
    json.should == %Q/[{"name":"#{PROVIDER_NAME}","image":"#{PROVIDER_IMAGE}","url":"#{PROVIDER_URL}"}]/
    
  end

end