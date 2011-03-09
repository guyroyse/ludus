$LOAD_PATH << 'src/ruby'

require 'model'

describe LudusUrl do
  
  REQUESTED_URL = 'http://example.com/foo'
  REQUESTED_PATH = '/foo'
  RETURN_URL = 'http://example.com/ludus.html'
  
  it 'returns the expect URL' do
    LudusUrl.new(REQUESTED_URL, REQUESTED_PATH).url.should == RETURN_URL
  end
  
end