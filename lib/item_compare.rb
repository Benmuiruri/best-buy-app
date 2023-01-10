require_relative 'item'

class ItemComparison
  def initialize(small_item, large_item)
    @small_item = small_item
    @large_item = large_item
  end

   def compare
    if @small_item.price_per_gram < @large_item.price_per_gram
      return "The smaller item is the better value."
    elsif @small_item.price_per_gram > @large_item.price_per_gram * 1.25
      difference = ((@small_item.price_per_gram - @large_item.price_per_gram) / @large_item.price_per_gram) * 100
      return "The larger item is the better value. The smaller item is #{difference.round(2)}% more expensive."
    else
      return "The two items are not significantly different in value. It is not worth spending more money on the larger item."
    end
  end
end