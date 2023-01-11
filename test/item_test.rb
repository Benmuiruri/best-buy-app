# frozen_string_literal: true

require_relative 'test_helper'

class ItemTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    @valid_item = Item.new('Soda', 10, 2)
  end

  def test_initialize
    assert_equal 10, @valid_item.price
    assert_equal 2, @valid_item.weight
  end

  def test_price_per_gram
    assert_equal 5.0, @valid_item.price_per_gram
  end

  def test_price_per_gram_with_zero_weight
    @item_with_zero_weight = Item.new('Soda', 10, 0)
    assert_raises(RuntimeError) { @item_with_zero_weight.price_per_gram }
  end
end
