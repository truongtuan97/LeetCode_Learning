def product_except_self(nums)
  answer = Array.new(nums.length, 1)
  subfix, prefix = 1, 1

  (0...nums.length).each do |index|
    answer[index] = prefix
    prefix *= nums[index]
  end

  (nums.length - 1).downto(0) do |index|
    answer[index] *= subfix
    subfix *= nums[index]
  end
  answer
end

puts product_except_self([1, 2, 3, 4]).inspect # => [24, 12, 8, 6]
