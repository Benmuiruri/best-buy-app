require_relative 'test_helper'
require 'pry'

class PurchaseHelperTest < Minitest::Test
  include Rack::Test::Methods

  def test_compare
    params = { small_price: 80, small_weight: 100, large_price: 150, large_weight: 120 }
    results = PurchaseHelper.new.compare(params)
    assert_equal 'The smaller item is the better value.', results[:comparison_result]
  end
end


