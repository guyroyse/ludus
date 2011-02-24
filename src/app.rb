require 'rubygems'
require 'sinatra'
require 'java'

java_import com.google.appengine.api.users.UserServiceFactory

get '/app/hello' do
  "Hello World"
end

get '/_ah/login_required' do
  user_service = UserServiceFactory.user_service
  user = user_service.current_user
  
  if user.nil?
    login_url = user_service.create_login_url(request.url, nil, 'google.com/accounts/o8/id', {});
    content = "<a href='#{login_url}'>Login Using Google</a>"
  else
    logout_url = user_service.create_logout_url(request.url)
    content = "Hello #{user.nickname}!"
    content += "<a href='#{logout_url}'>Logout</a>"
  end
  
  content_type 'text/html'
  content
end