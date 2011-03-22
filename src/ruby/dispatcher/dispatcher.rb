require 'rubygems'
require 'sinatra'
require 'java'
require 'json'
require 'controllers'

java_import com.hardboiledgeek.ludus.service.LudusUserService

get '/_ah/login_required' do
  user = LudusUserService.current_user  
  if user.nil?
    redirect '/home.html'
  else
    redirect '/ludus.html'
  end
end

get '/public/api/login-urls' do
  json_api { LoginController.new.login_urls request.url, request.path, '/ludus.html' }
end

get '/api/logout-url' do
  json_api { LoginController.new.logout_url '/home.html' }
end

get '/public/api/current-user' do
  json_api do
    user = LudusUserService.current_user
    if (user.nil?)
      return { :loggedIn => false }.to_json
    else
      return { :loggedIn => true, :name => user.nickname }.to_json
    end
  end
end
