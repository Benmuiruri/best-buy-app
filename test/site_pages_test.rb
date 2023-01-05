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
end
