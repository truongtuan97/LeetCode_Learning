def max_profit(prices)
  max_profit = 0
  min_price = prices[0]
  prices.each_with_index do |price, index|
    if price < min_price
      min_price = price
    end
    max_profit = [max_profit, price - min_price].max
  end
  max_profit
end

puts max_profit([7, 1, 5, 3, 6, 4])
