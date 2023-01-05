require 'sinatra'

get '/' do
  @title = 'Home'
  erb :index
end

get '/about' do
  @title = 'About'
  erb :about
end

get '/compare' do
  @title = 'Compare'
  erb :compare
end

post '/check' do
  raise params.inspect
end