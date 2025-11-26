def remove_duplicates(nums)
  write = 0
  (0...nums.length).each do |i|
    if nums[i] != nums[write]
      nums[write] = nums[i]
      write += 1
    end
  end
  return write, nums
end

slow, nums = remove_duplicates([0, 1, 1, 2, 3, 3])
puts "Length after removing duplicates: #{slow}"
puts "Array after removing duplicates: #{nums.inspect}"
