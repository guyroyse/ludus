require 'rubygems'
require 'sinatra'
require 'controllers'

HOME_URL = '/home.html'
LOBBY_URL = '/ludus.html'

get '/_ah/login_required' do
  redirect LoginController.new.login_required_redirect(HOME_URL, LOBBY_URL)
end

get '/public/api/login-urls' do
  json_api { LoginController.new.login_urls request.url, request.path, LOBBY_URL }
end

get '/api/logout-url' do
  json_api { LoginController.new.logout_url HOME_URL }
end

get '/public/api/current-user' do
  json_api { UserController.new.current_user }
end
