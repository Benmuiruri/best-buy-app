def compare_item_values(small_price, small_weight, large_price, large_weight)
  # Calculate the price per gram for each size
  computed_small_price_per_gram = small_price / small_weight
  computed_large_price_per_gram = large_price / large_weight

  # Compare the two values and determine which size is the better value
  if computed_small_price_per_gram < computed_large_price_per_gram
    puts "The smaller item is the better value. Price per gram: $#{computed_small_price_per_gram.round(2)}"
  elsif computed_small_price_per_gram > computed_large_price_per_gram * 1.25
    puts "The larger item is the better value. Price per gram: $#{computed_large_price_per_gram.round(2)}"
    difference = ((computed_small_price_per_gram - computed_large_price_per_gram) / computed_large_price_per_gram) * 100
    puts "The smaller item is #{difference.round(2)}% more expensive."
  else
    puts "The two items are not significantly different in value. Price per gram for the smaller item: $#{computed_small_price_per_gram.round(2)}. Price per gram for the larger item: $#{computed_large_price_per_gram.round(2)}"
    puts "It is not worth spending more money on the larger item."
  end

  # Calculate the percentage difference between buying two of the smaller item or one of the larger item
  price_difference = small_price* 2 - large_price
  discount = price_difference / large_price * 100

  if discount > 0
    puts "You can save #{discount.round(2)}% by buying the larger item."
  else
    puts "You can save $#{price_difference.round(2)} by buying two of the smaller item."
  end
end