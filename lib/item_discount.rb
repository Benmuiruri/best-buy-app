require_relative 'item'

class ItemDiscount
  def initialize(small_item, large_item)
    @small_item = small_item
    @large_item = large_item
  end

  def discount
    price_difference = @small_item.price * 2 - @large_item.price
    discount = price_difference.to_f / @large_item.price * 100

    if discount > 0
      return "You will save #{price_difference}sh by buying the larger item instead of two small items."
    else
      return "You will save #{price_difference.abs}sh by buying two of the smaller item."
    end
  end
end