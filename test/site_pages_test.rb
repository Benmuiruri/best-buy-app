require_relative 'test_helper'

class BestBuyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert doc(last_response).at_css('h1').text.include?('Best Buy')
  end

  def test_about
    get '/about'
    assert last_response.ok?
    assert doc(last_response).at_css('h1').text.include?('About')
  end

  def test_compare
    get '/compare'
    assert last_response.ok?
    assert doc(last_response).at_css('h1').text.include?('Price Comparison')
  end
end