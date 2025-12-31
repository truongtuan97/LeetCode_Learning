def three_sum(nums)
  nums.sort!
  result = []

  (0...nums.size).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]

    left = i + 1
    right = nums.size - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]

      if sum == 0
        result << [nums[i], nums[left], nums[right]]

        while left < right && nums[left] == nums[left + 1]
          left += 1
        end

        while left < right && nums[right] == nums[right - 1]
          right -= 1
        end

        left += 1
        right -= 1
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end
  result
end

# Example
nums = [-1, 0, 1, 2, -1, -4]
puts three_sum(nums).inspect
