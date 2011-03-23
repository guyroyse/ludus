require 'rubygems'
require 'sinatra'
require 'java'
require 'controllers'

java_import com.hardboiledgeek.ludus.service.LudusUserService

get '/_ah/login_required' do
  redirect LoginController.new.login_required_redirect('/home.html', '/ludus.html')
end

get '/public/api/login-urls' do
  json_api { LoginController.new.login_urls request.url, request.path, '/ludus.html' }
end

get '/api/logout-url' do
  json_api { LoginController.new.logout_url '/home.html' }
end

get '/public/api/current-user' do
  json_api { UserController.new.current_user }
end
