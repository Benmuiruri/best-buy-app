require_relative 'item'

class ItemComparison
  THRESHOLD = 0.25

  def initialize(small_item, large_item)
    @small_item, @large_item = small_item, large_item
  end

  def compare
    product_name = @small_item.item_name
    difference = (@small_item.price_per_gram - @large_item.price_per_gram) / @large_item.price_per_gram
    if difference < 0
      "The smaller #{product_name} is the better value."
    elsif difference > THRESHOLD
      "The larger #{product_name} is the better value. The smaller #{product_name} is #{(difference * 100).round(2)}% more expensive."
    else
      "The two #{product_name}s are not significantly different in value. It is not worth spending more money on the larger #{product_name}."
    end
  end
end
