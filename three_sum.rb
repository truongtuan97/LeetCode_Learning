def three_sum(nums)
  nums.sort!
  n = nums.size
  results = []
  (0...nums.size).each do |i|
    next if i > 0 && nums[i - 1] == nums[i]

    left = i + 1
    right = n - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == 0
        results << [nums[i], nums[left], nums[right]]

        left += 1 while left < right && nums[left] == nums[left + 1]
        right -= 1 while left < right && nums[right] == nums[right - 1]
        left += 1
        right -= 1
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end
  results
end

def three_sum_brutforce(nums)
  results = []

  (0...nums.size - 2).each do |i|
    (1...nums.size - 1).each do |j|
      (2...nums.size).each do |k|
        if nums[i] + nums[j] + nums[k] == 0
          tripple = [nums[i], nums[j], nums[k]].sort
          if !results.include?(tripple)
            results << tripple
          end
        end
      end
    end
  end
  results
end

puts "=" * 70
puts three_sum([-4, -1, 1, 3, 5]).inspect # => [[-4, -1, 5], [-4, 1, 3]]
puts "=" * 70
puts "With brutforce"
puts three_sum_brutforce([-4, -1, 1, 3, 5]).inspect # => [[-4, -1, 5], [-4, 1, 3]]
