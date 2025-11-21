def move_zeroes(nums)
  write = 0
  (0...nums.length).each do |i|
    if nums[i] != 0
      nums[write] = nums[i]
      write += 1
    end
  end
  while write < nums.length
    nums[write] = 0
    write += 1
  end
  nums
end

puts move_zeroes([0, 1, 0, 3, 12]).inspect
