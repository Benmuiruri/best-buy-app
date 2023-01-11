require_relative 'test_helper'

class ItemDiscountTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    @small_item = Item.new(80, 100)
    @large_item = Item.new(100, 200)
  end

  def test_initialize
    item_discount = ItemDiscount.new(@small_item, @large_item)
    assert_equal @small_item, item_discount.instance_variable_get(:@small_item)
    assert_equal @large_item, item_discount.instance_variable_get(:@large_item)
  end

  def test_discount
    item_discount = ItemDiscount.new(@small_item, @large_item)
    price_difference = @small_item.price * 2 - @large_item.price
    result = "You will save #{price_difference}sh by buying the larger item instead of two small items."
    assert_equal result, item_discount.discount
  end
end