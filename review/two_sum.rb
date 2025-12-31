def two_sum(nums, target)
  return [] if nums.empty?

  hash = {}

  nums.each_with_index do |num, i|
    complement = target - num
    if hash.keys.include?(complement)
      return [hash[complement], i]
    else
      hash[num] = i
    end
  end
  []
end

# Example
nums = [3, 4, 5, 6]
target = 7
puts two_sum(nums, target).inspect
