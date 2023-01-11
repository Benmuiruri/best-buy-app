# frozen_string_literal: true

require_relative 'test_helper'

class ItemComparisonTest < Minitest::Test
  def setup
    @small_item = Item.new('soda', 80, 100)
    @large_item = Item.new('soda', 100, 200)
    @product_name = @small_item.item_name
  end

  def test_initialize
    item_comparison = ItemComparison.new(@small_item, @large_item)
    assert_equal @small_item, item_comparison.instance_variable_get(:@small_item)
    assert_equal @large_item, item_comparison.instance_variable_get(:@large_item)
  end

  def test_compare
    item_comparison = ItemComparison.new(@small_item, @large_item)
    difference = ((@small_item.price_per_gram - @large_item.price_per_gram) / @large_item.price_per_gram) * 100
    result = "The larger #{@product_name} is the better value. The smaller #{@product_name} is #{difference.round(2)}% more expensive."
    assert_equal result, item_comparison.compare
  end
end
