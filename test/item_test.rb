require_relative 'test_helper'

class ItemTest < Minitest::Test
  include Rack::Test::Methods

  def test_initialize
    item = Item.new(10, 2)
    assert_equal 10, item.price
    assert_equal 2, item.weight
  end

  def test_price_per_gram
    item = Item.new(10, 2)
    assert_equal 5.0, item.price_per_gram
  end

  def test_price_per_gram_with_zero_weight
    item = Item.new(10, 0)
    assert_raises(RuntimeError) { item.price_per_gram }
  end
end