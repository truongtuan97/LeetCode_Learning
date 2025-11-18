def product_except_self(nums)
  prefix = 1
  suffix = 1
  answer = Array.new(nums.length, 1)

  (0...nums.length).each do |i|
    answer[i] = prefix
    prefix *= nums[i]
  end

  (nums.length - 1).downto(0) do |i|
    answer[i] *= suffix
    suffix *= nums[i]
  end
  answer
end

puts product_except_self([1, 2, 3, 4]).inspect
