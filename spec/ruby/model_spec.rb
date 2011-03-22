$LOAD_PATH << 'src/ruby'

require 'model'

describe LudusUrl do
  it 'returns the expected URL' do
    LudusUrl.new(REQUESTED_URL, REQUESTED_PATH, LUDUS_URL).url.should == RETURN_URL
  end
  
end

describe LogoutUrl do
  it 'returns the expected URL' do
    adapter = stub('adapter')
    adapter.should_receive(:get_logout_url).with(HOME_URL).and_return(LOGOUT_URL)
    UserServiceAdapter.should_receive(:new).and_return(adapter)
    LogoutUrl.new(HOME_URL).url.should == LOGOUT_URL
  end
end

describe OpenIdProviders do
  
  it 'returns the five expected providers' do
    
    adapter = stub('adapter')
    adapter.should_receive(:get_login_url).any_number_of_times.and_return(PROVIDER_URL)
    UserServiceAdapter.should_receive(:new).any_number_of_times.and_return(adapter)
    
    expected_hashes = [ 
      {:name => 'Google', :image => 'google.png', :url => PROVIDER_URL}, 
      {:name => 'Yahoo!', :image => 'yahoo.png', :url => PROVIDER_URL}, 
      {:name => 'MySpace', :image => 'logo_myspace_s.gif', :url => PROVIDER_URL}, 
      {:name => 'AOL', :image => 'aol.png', :url => PROVIDER_URL}, 
      {:name => 'MyOpenID', :image => 'myopenid.png', :url => PROVIDER_URL} 
    ]

    count = 0
    OpenIdProviders.new(RETURN_URL).each do |provider|
      provider.to_hash.should == expected_hashes[count]
      count += 1
    end
    
    count.should == 5
  
  end
  
end