# frozen_string_literal: true

require_relative 'item'

class ItemDiscount
  def initialize(small_item, large_item)
    @small_item = small_item
    @large_item = large_item
  end

  def discount
    product_name = @small_item.item_name
    price_difference = @large_item.price - @small_item.price * 2
    if price_difference.positive?
      "You will only save #{price_difference}sh by buying the larger #{product_name} instead of two small #{product_name}s and not get much value."
    elsif price_difference.zero?
      "You will get more #{product_name} for the same price by buying the larger #{product_name}."
    else
      "You will spend #{price_difference.abs}sh more but get more #{product_name} by buying the larger #{product_name} instead of two small #{product_name}s."
    end
  end
end
