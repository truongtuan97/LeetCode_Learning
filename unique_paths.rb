def unique_paths(m, n)
  dp = Array.new(m) { Array.new(n, 1) }

  (1...m).each do |i|
    (1...n).each do |j|
      dp[i][j] = dp[i-1][j] + dp[i][j-1]
    end
  end
  dp[m-1][n-1]
end

def unique_path_on(m, n)
  dp = Array.new(n, 1)

  (1..m).each do
    (1..n).each do |j|
      dp[j] += dp[j-1]
    end
  end

  dp[n-1]
end

puts unique_paths(3, 7)

puts unique_paths(3, 7)