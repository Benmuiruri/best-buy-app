require_relative 'item'
require_relative 'item_compare'
require_relative 'item_discount'

small_item = Item.new(80, 100)
large_item = Item.new(100, 200)

comparison = ItemComparison.new(small_item, large_item)

comparison.compare

discount = ItemDiscount.new(small_item, large_item)

discount.discount