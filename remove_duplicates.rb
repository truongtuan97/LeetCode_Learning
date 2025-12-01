def remove_duplicates(nums)
  write = 0
  (1...nums.size).each do |i|
    if nums[write] != nums[i]
      write += 1
      nums[write] = nums[i]
    end
  end
  return write+1, nums
end

slow, nums = remove_duplicates([0, 1, 1, 2, 3, 3])
puts "Length after removing duplicates: #{slow}" # => 4
puts "Array after removing duplicates: #{nums.inspect}" # => [0,1,2,3,3,3]
