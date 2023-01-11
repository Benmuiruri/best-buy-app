# frozen_string_literal: true

require_relative 'test_helper'

class ItemDiscountTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    @small_item = Item.new('soda', 80, 100)
    @large_item = Item.new('soda', 100, 200)
    @product_name = @small_item.item_name
  end

  def test_initialize
    item_discount = ItemDiscount.new(@small_item, @large_item)
    assert_equal @small_item, item_discount.instance_variable_get(:@small_item)
    assert_equal @large_item, item_discount.instance_variable_get(:@large_item)
  end

  def test_discount
    item_discount = ItemDiscount.new(@small_item, @large_item)
    price_difference = @large_item.price - @small_item.price
    result = "You will spend #{price_difference}sh more for the large #{@product_name} but it offers more value than two small #{@product_name}s."
    assert_equal result, item_discount.discount
  end
end
