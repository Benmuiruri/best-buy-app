class Item
  attr_reader :price, :weight

  def initialize(price, weight)
    @price = price
    @weight = weight
  end

  def price_per_gram
    raise 'weight cannot be zero' if @weight == 0

    @price.to_f / @weight
  end
end