require 'rubygems'
require 'sinatra'
require 'java'

java_import com.hardboiledgeek.ludus.service.LudusUserService

get '/app/hello' do
  "Hello World"
end

get '/_ah/login_required' do
  user = LudusUserService.current_user
  
  if user.nil?
    login_url = LudusUserService.create_open_id_login_url request.url, 'google.com/accounts/o8/id'
    content = "<a href='#{login_url}'>Login Using Google</a>"
  else
    logout_url = LudusUserService.create_logout_url '/logout.html'
    content = "Hello #{user.nickname}!"
    content += "<a href='#{logout_url}'>Logout</a>"
  end
  
  content_type 'text/html'
  content
end