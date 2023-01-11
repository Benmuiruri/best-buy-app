# frozen_string_literal: true

require_relative 'item'

# ItemDiscount class to calculate discount saved by choosing one item over another
class ItemDiscount
  def initialize(small_item, large_item)
    @small_item = small_item
    @large_item = large_item
  end

  def discount
    product_name = @large_item.item_name
    small_item_price, large_item_price = @small_item.price, @large_item.price

    if large_item_price > small_item_price * 2
      savings = small_item_price * 2 - large_item_price
      "You will save #{savings}sh by buying the larger #{product_name} instead of two small #{product_name}s."
    elsif large_item_price < small_item_price * 2
      extra_cost = large_item_price - small_item_price
      "You will spend #{extra_cost.abs}sh more for the large #{product_name} but it offers more value than two small #{product_name}s."
    else
      "You will get the same value either buying two small #{product_name}s or the large #{product_name}."
    end
  end
end
