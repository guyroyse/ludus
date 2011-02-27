require 'rubygems'
require 'sinatra'
require 'java'
require 'json'

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
  url = request.url.sub(/#{Regexp.escape(request.path)}$/, '') + '/ludus.html'
  content_type "application/json"
  [
    { :name => 'Google',    :image => 'google.png',           :url => login_url(url, 'google.com/accounts/o8/id') },
    { :name => 'Yahoo!',    :image => 'yahoo.png',            :url => login_url(url, 'yahoo.com') },
    { :name => 'MySpace',   :image => 'logo_myspace_s.gif',   :url => login_url(url, 'myspace.com') },
    { :name => 'AOL',       :image => 'aol.png',              :url => login_url(url, 'aol.com') },
    { :name => 'MyOpenID',  :image => 'myopenid.png',         :url => login_url(url, 'myopenid.com') }
  ].to_json
end

get '/public/api/current-user' do
  user = LudusUserService.current_user
  content_type "application/json"
  {
    :loggedIn => !user.nil?
  }.to_json
end

get '/api/logout-url' do
  content_type "application/json"
  { :url => logout_url }.to_json
end

def login_url(url, provider_url)
  LudusUserService.create_open_id_login_url url, provider_url  
end

def logout_url
  LudusUserService.create_logout_url '/home.html'
end