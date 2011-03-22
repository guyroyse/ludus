require 'rubygems'
require 'sinatra'

def json_api
  content_type "application/json"
  yield
end
