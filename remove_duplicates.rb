def remove_duplicates(nums)
  write = 0
  nums.each_with_index do |num, index|
    if num != nums[write]      
      write += 1
      nums[write] = num
    end
  end
  return write, nums
end

slow, nums = remove_duplicates([0, 1, 1, 2, 3, 3])
puts "Length after removing duplicates: #{slow}" # => 4
puts "Array after removing duplicates: #{nums.inspect}" # => [0,1,2,3,3,3]
