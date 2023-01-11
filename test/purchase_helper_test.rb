# frozen_string_literal: true

require_relative 'test_helper'
class PurchaseHelperTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    @small_item = Item.new('soda', 80, 100)
    @product_name = @small_item.item_name
  end

  def test_compare
    params = { product_name: 'soda', small_price: 80, small_weight: 100, large_price: 150, large_weight: 120 }
    results = PurchaseHelper.new.compare(params)
    assert_equal "The smaller #{@product_name} is the better value.", results[:comparison_result]
  end
end
