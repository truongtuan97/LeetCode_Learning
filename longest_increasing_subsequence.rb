def length_of_lis_dp(nums)
  n = nums.size
  return 0 if nums.empty?

  dp = Array.new(n, 1)

  (0...nums.size).each do |i|
    (0...i).each do |j|
      dp[i] = [dp[i], dp[j] + 1].max if nums[j] < nums[i]
    end
  end
  dp.max
end

def length_of_lis(nums)
  tails = []
  nums.each do |num|
    left = 0
    right = tails.size
    while left < right
      mid = (left + right) / 2
      if tails[mid] < num
        left = mid + 1
      else
        right = mid
      end
    end
    tails[left] = num
  end
  tails.length
end

def lis_with_sequence(nums)
  return 0 if nums.size == 0

  n = nums.size
  dp = Array.new(n, 1)
  parent = Array.new(n, -1)

  max_idx = 0
  (0...n).each do |i|
    (0...i).each do |j|
      if nums[j] < nums[i] && dp[i] < dp[j] + 1
        dp[i] = dp[j] + 1
        parent[i] = j
      end
    end
    max_idx = i if max_idx < i
  end
  puts "parent: #{parent} - max_idx: #{max_idx}"
  puts "nums: #{nums}"
  list = []
  while max_idx != -1
    list << nums[max_idx]
    max_idx = parent[max_idx]
  end
  puts "list: #{list}"
  dp.max
end
p length_of_lis_dp([10, 9, 2, 5, 3, 7, 101, 18]) # 4
p length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]) # 4
p lis_with_sequence([10, 9, 2, 5, 3, 7, 101, 18]) # 4
