def coin_change(coins, amount)
  dp = Array.new(amount + 1, Float::INFINITY)
  choice = Array.new(amount + 1, -1)
  dp[0] = 0

  (1..amount).each do |i|
    coins.each do |coin|
      if coin <= i && (dp[i - coin] + 1) < dp[i]
        dp[i] = dp[i - coin] + 1
        choice[i] = coin
      end
    end
  end

  return [-1, []] if dp[amount] == Float::INFINITY

  [dp[amount], choice]
end

def reverse(amount, choice)
  result = []
  current = amount
  while current > 0
    coin = choice[current]
    result << coin
    current -= coin
  end
  result
end

# Ví dụ
coins = [1, 2, 5]
amount = 11
coin_number, choice = coin_change(coins, amount)
puts "coin number: #{coin_number}"
puts "choice: #{choice.inspect}"

puts reverse(amount, choice)
