def climb_stairs_with_dp(n)
  return 1 if n == 1
  return 2 if n == 2

  dp = Array.new(n + 1)
  dp[1] = 1
  dp[2] = 2
  (3..n).each do |i|
    dp[i] = dp[i - 1] + dp[i - 2]
  end
  dp[n]
end

def climb_stair_optimize(n)
  return 1 if n == 1
  return 2 if n == 2

  a = 1
  b = 2
  (3..n).each do |i|
    c = b + a
    a = b
    b = c
  end
  b
end

# Ví dụ
p climb_stairs_with_dp(100)

p climb_stair_optimize(100)
