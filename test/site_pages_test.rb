require_relative 'test_helper'

class BestBuyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert_equal 200, last_response.status
    assert_includes doc(last_response).at_css('h1').text, 'Best Buy'
  end

  def test_about
    get '/about'
    assert_equal 200, last_response.status
    assert_includes doc(last_response).at_css('h1').text, 'About'
  end

  def test_compare
    get '/compare'
    assert_equal 200, last_response.status
    assert_includes doc(last_response).at_css('h1').text, 'Price Comparison'
  end

  def test_check
    post '/check', product_name: "soda", small_price: 80, small_weight: 100, large_price: 150, large_weight: 120
    assert_equal 200, last_response.status
    result = 'The smaller soda is the better value.'
    assert_equal result, doc(last_response).at_css('p').text
  end
end
