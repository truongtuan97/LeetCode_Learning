def can_jump(nums)
  max_reach = 0
  (0...nums.size).each do |i|
    return false if i > max_reach
    max_reach = [max_reach, i+nums[i]].max
  end
  true
end

nums = [2, 3, 1, 1, 4]
puts can_jump(nums)

nums = [3, 2, 1, 0, 4]
puts can_jump(nums)