def move_zeroes(nums)
  # left = 0

  # (0...nums.size).each do |right|
  #   if nums[right] != 0
  #     nums[left], nums[right] = nums[right], nums[left]
  #     left += 1
  #   end
  # end
  # nums
  write = 0
  (0...nums.size).each do |i|
    if nums[i] != 0
      nums[write] = nums[i]
      write += 1
    end
  end
  (write...nums.size).each do |i|
    nums[i] = 0
  end
  nums
end

puts move_zeroes([0, 1, 0, 3, 12]).inspect # => [1,3,12,0,0]
