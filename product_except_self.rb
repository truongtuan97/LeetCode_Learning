def product_except_self(nums)
  answer = Array.new(nums.length, 1)
  prefix, suffix = 1, 1

  (0...nums.length).each do |i|
    answer[i] = prefix
    prefix *= nums[i]
  end
  puts answer.inspect
  (nums.length - 1).downto(0) do |i|
    answer[i] *= suffix
    suffix *= nums[i]
  end
  answer
end

puts product_except_self([1, 2, 3, 4]).inspect # => [24, 12, 8, 6]
