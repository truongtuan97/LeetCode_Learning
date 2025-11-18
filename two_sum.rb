def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, i|
    return [hash[target - num], i] if hash.key?(target - num)

    hash[num] = i
  end
end

puts two_sum([2, 7, 11, 15], 9).inspect