require_relative 'item'
require_relative 'item_compare'
require_relative 'item_discount'

class PurchaseHelper
  def compare(params)
    product_name = params[:product_name]
    small_price, small_weight, large_price, large_weight = params.values_at(:small_price, :small_weight, :large_price, :large_weight).map(&:to_f)

    small_item = Item.new(product_name, small_price, small_weight)
    large_item = Item.new(product_name, large_price, large_weight)

    comparison = ItemComparison.new(small_item, large_item)
    discount = ItemDiscount.new(small_item, large_item)

    { 
      comparison_result: comparison.compare,
      discount_result: discount.discount
    }
  end
end
