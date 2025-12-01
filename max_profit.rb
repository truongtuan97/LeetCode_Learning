def max_profit(prices)
  max_profit = 0
  min_price = prices[0]

  (1...prices.size).each do |i|
    if min_price > prices[i]
      min_price = prices[i]
    end
    max_profit = [max_profit, prices[i] - min_price].max
  end
  max_profit
end

puts max_profit([7, 1, 5, 3, 6, 4]) # => 5
