def move_zeroes(nums)
  write = 0
  (0...nums.length).each do |index|
    if nums[index] != 0
      nums[write] = nums[index]
      write += 1
    end
  end
  while write < nums.length
    nums[write] = 0
    write += 1
  end
  nums
end

puts move_zeroes([0, 1, 0, 3, 12]).inspect # => [1,3,12,0,0]
