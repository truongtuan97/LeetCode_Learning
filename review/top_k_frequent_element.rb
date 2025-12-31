def top_k_frequent_element(nums, k)
  hash = Hash.new(0)

  nums.each_with_index do |num, i|
    hash[num] += 1
  end

  hash = hash.sort_by { |k, v| -v }.to_h.take(k)
  hash.to_h.keys
end

# Example
nums = [1,2,2,3,3,3]
k = 2
puts top_k_frequent_element(nums, k).inspect

nums = [7,7]
k = 1
puts top_k_frequent_element(nums, k).inspect