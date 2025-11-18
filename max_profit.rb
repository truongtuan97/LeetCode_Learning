def max_profit(prices)
  return 0 if prices.empty?

  min_price = prices[0]
  max_profit = 0

  prices.each do |price|
    if price < min_price
      min_price = price
    else
      profit = price - min_price
      max_profit = [max_profit, profit].max
    end
  end
  max_profit
end

puts max_profit([7, 1, 5, 3, 6, 4])
