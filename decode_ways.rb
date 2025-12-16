def decode_ways(nums)
  return 0 if nums[0] == "0"
  dp = Array.new(nums.size + 1, 0)
  dp[0] = 1
  dp[1] = 1

  (2..nums.size).each do |i|
    one = nums[i - 1].to_i
    two = nums[i - 2..i - 1].to_i

    dp[i] += dp[i - 1] if one >= 0
    dp[i] += dp[i - 2] if two >= 10 && two <= 26
  end

  dp[nums.size]
end

def decode_ways_o1(nums)
  return 0 if nums[0] == "0"

  prev = 1
  prev2 = 1

  (2..nums.size).each do |i|
    current = 0
    one = nums[i - 1].to_i
    two = nums[i - 2..i - 1].to_i

    current += prev if one >= 0
    current += prev2 if two >= 10 && two <= 26

    prev2 = prev
    prev = current
  end
  prev
end

puts decode_ways("226")

puts decode_ways_o1("226")
