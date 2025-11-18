def move_zeroes(nums)
  # move non-zero to front
  write = 0
  nums.each_with_index do |num, _index|
    if num != 0
      nums[write] = num
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
