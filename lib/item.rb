class Item
  attr_reader :price, :weight

  def initialize(name, price, weight)
    @name = name
    @price = price
    @weight = weight
  end

  def item_name
    @name
  end

  def price_per_gram
    raise 'weight cannot be zero' if @weight == 0

    @price.to_f / @weight
  end
end