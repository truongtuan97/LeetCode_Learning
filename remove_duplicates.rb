def remove_duplicates(nums)
  slow = 0
  (0...nums.length).each do |i|
    if nums[i] != nums[slow]
      slow += 1
      nums[slow] = nums[i]
    end
  end
  slow += 1
  return slow, nums
end

slow = remove_duplicates([0, 1, 1, 2, 3, 3])
puts "Length after removing duplicates: #{slow}"
