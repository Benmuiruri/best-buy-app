require_relative 'item'

class ItemComparison
  def initialize(small_item, large_item)
    @small_item = small_item
    @large_item = large_item
  end

  def compare
    if @small_item.price_per_gram < @large_item.price_per_gram
      puts "The smaller item is the better value."
    elsif @small_item.price_per_gram > @large_item.price_per_gram * 1.25
      puts "The larger item is the better value."
      difference = ((@small_item.price_per_gram - @large_item.price_per_gram) / @large_item.price_per_gram) * 100
      puts "The smaller item is #{difference.round(2)}% more expensive."
    else
      puts "The two items are not significantly different in value."
      puts 'It is not worth spending more money on the larger item.'
    end
  end
end