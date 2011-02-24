require 'rubygems'
require 'sinatra'
require 'java'

java_import com.google.appengine.api.users.UserServiceFactory
java_import java.util.Set

get '/app/hello' do
  "Hello World"
end

get '/_ah/login_required' do
  user_service = UserServiceFactory.user_service
  user = user_service.current_user
  
  if user.nil?
    user_service.java_class.declared_methods.each do |method|
      if method.name == 'createLoginURL' && method.parameter_types.length == 4 then
        login_url = method.invoke user_service.java_object, request.url, nil, 'google.com/accounts/o8/id', nil
      end 
    end
    content = "<a href='#{login_url}'>Login Using Google</a>"
  else
    create_logout_url = user_service.java_class.method 'create_logout_url', java.lang.String
    logout_url = create_logout_url.invoke  request.url
    content = "Hello #{user.nickname}!"
    content += "<a href='#{logout_url}'>Logout</a>"
  end
  
  content_type 'text/html'
  content
end