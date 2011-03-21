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
  content_type "application/json"
  LoginController.new.login_urls request.url, request.path, '/ludus.html'
end

get '/api/logout-url' do
  content_type "application/json"
  LoginController.new.logout_url '/home.html'
end

get '/public/api/current-user' do
  user = LudusUserService.current_user
  content_type "application/json"
  if (user.nil?)
    return { :loggedIn => false }.to_json
  else
    return { :loggedIn => true, :name => user.nickname }.to_json
  end
end
