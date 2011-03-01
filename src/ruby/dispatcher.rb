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
  LoginUrlController.new.execute request.url, request.path
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

get '/api/logout-url' do
  content_type "application/json"
  { :url => logout_url }.to_json
end

def logout_url
  LudusUserService.create_logout_url '/home.html'
end