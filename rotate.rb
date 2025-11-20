def rotate(nums, k)
  reverse(nums, 0, nums.length - 1)
  reverse(nums, 0, k - 1)
  reverse(nums, k, nums.length - 1)
  nums
end

def reverse(nums, start_index, end_index)
  left, right = start_index, end_index
  while left < right
    nums[left], nums[right] = nums[right], nums[left]
    left += 1
    right -= 1
  end
end

puts rotate([1,2,3,4,5,6,7], 3).inspect