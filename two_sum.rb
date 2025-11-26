def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, index|
    if hash.key?(target - num)
      return [hash[target - num], index]
    end
    hash[num] = index
  end
  []
end

puts two_sum([2, 7, 11, 15], 9).inspect # => [0,1]
puts two_sum([2, 7, 4, 15], 11).inspect # => [1,2]