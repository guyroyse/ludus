require 'rubygems'
require 'sinatra'
require 'java'
require 'json'

java_import com.hardboiledgeek.ludus.service.LudusUserService

get '/app/hello' do
  "Hello World"
end

get '/_ah/login_required' do
  user = LudusUserService.current_user  
  if user.nil?
    redirect '/login.html'
  else
    redirect '/app/main.html'
  end
end

get '/public/api/login-urls' do
  url = request.url.sub(/#{Regexp.escape(request.path)}$/, '') + '/app/main.html'
  content_type "application/json"
  { :status => 'ok',  :data => [
    { :name => 'Google',    :image => '',   :url => login_url(url, 'google.com/accounts/o8/id') },
    { :name => 'Yahoo!',    :image => '',   :url => login_url(url, 'yahoo.com') },
    { :name => 'MySpace',   :image => '',   :url => login_url(url, 'myspace.com') },
    { :name => 'AOL',       :image => '',   :url => login_url(url, 'aol.com') },
    { :name => 'MyOpenID',  :image => '',   :url => login_url(url, 'myopenid.com') }
  ]}.to_json
end

get '/api/logout-url' do
  content_type "application/json"
  { :status => 'ok',  :data => logout_url }.to_json
end

def login_url(url, provider_url)
  LudusUserService.create_open_id_login_url url, provider_url  
end

def logout_url
  LudusUserService.create_logout_url '/logout.html'
end