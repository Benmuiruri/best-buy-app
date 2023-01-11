# frozen_string_literal: true

require 'sinatra'
require 'sinatra/param'
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

error Sinatra::Param::InvalidParameterError do
  status 400
  { message: env['sinatra.error'].message }.to_json
end

post '/check' do
  param :product_name, String, required: true
  param :small_price,  Float, required: true, min: 1
  param :small_weight, Float, required: true, min: 1
  param :large_price,  Float, required: true, min: 1
  param :large_weight, Float, required: true, min: 1

  @results = PurchaseHelper.new.compare(params)
  erb :result
end
