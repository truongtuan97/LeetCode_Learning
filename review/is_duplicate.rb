def is_duplicate(nums)
  hash = {}

  nums.each_with_index do |num, i|
    if hash.keys.include?(num)
      return true
    else
      hash[num] = i
    end
  end
  false
end

# Example: 
nums = [1, 2, 3, 3]
puts is_duplicate(nums)

nums = [1, 2, 3, 4]
puts is_duplicate(nums)