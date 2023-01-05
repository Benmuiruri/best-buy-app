require 'sinatra'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/compare' do
  erb :compare
end