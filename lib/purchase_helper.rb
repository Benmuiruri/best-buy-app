require_relative 'item'
require_relative 'item_compare'
require_relative 'item_discount'

class PurchaseHelper
  def compare(params)
    small_price = params[:small_price].to_f
    small_weight = params[:small_weight].to_f
    large_price = params[:large_price].to_f
    large_weight = params[:large_weight].to_f

    small_item = Item.new(small_price, small_weight)
    large_item = Item.new(large_price, large_weight)
    comparison = ItemComparison.new(small_item, large_item)
    comparison_result = comparison.compare

    discount = ItemDiscount.new(small_item, large_item)
    discount_result = discount.discount

    results = { comparison_result: comparison_result, discount_result: discount_result }
  end
end
