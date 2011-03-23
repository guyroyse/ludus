REQUESTED_URL = 'http://example.com/foo'
REQUESTED_PATH = '/foo'
PROVIDER_NAME = 'foo'
PROVIDER_IMAGE = 'bar.png'
PROVIDER_URL = 'http://provider.example.com'
OPENID_URL = 'http://openid.example.com'
LUDUS_URL = '/ludus.html'
USER_NICKNAME = 'test@example.com'
HOME_URL = 'http://example.com/home.html'
LOBBY_URL = 'http://example.com/ludus.html'
LOGOUT_URL = 'http://example.com/logout'
RETURN_URL = LOBBY_URL

def stub_logged_in_current_user
  stub_current_user true, USER_NICKNAME
end

def stub_logged_out_current_user
  stub_current_user false, nil
end

def stub_current_user(logged_in, nickname)
  user = stub('user');
  user.should_receive(:logged_in).any_number_of_times.and_return(logged_in)
  user.should_receive(:nickname).any_number_of_times.and_return(nickname)
  CurrentUser.should_receive(:new).and_return(user)
end