def remove_duplicates(nums)
  return 0 if nums.empty?

  slow = 0
  (1...nums.length).each do |fast|
    if nums[fast] != nums[slow]
      slow += 1
      nums[slow] = nums[fast]
    end
  end
  [slow + 1, nums]
end

puts remove_duplicates([0, 1, 1, 2, 3, 3]).inspect
