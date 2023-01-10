require 'sinatra'
require 'pry'
require_relative 'lib/purchase_helper'

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
  @results = compare
  erb :result
end