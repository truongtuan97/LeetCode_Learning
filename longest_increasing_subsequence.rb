def length_of_lis_dp(nums)
  n = nums.size
  return 0 if nums.empty?

  dp = Array.new(n, 1)

  (0...nums.size).each do |i|
    (1...i).each do |j|
      dp[i] = [dp[i], dp[j] + 1].max if nums[j] < nums[i]
    end
  end
  dp.max
end

def length_of_lis(nums)
  tails = []
  nums.each do |num|
    left = 0
    right = tails.length
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

p length_of_lis_dp([10, 9, 2, 5, 3, 7, 101, 18]) # 4
p length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]) # 4
