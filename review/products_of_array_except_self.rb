def product_of_array_except_self(nums)
  result = Array.new(nums.size, 1)

  temp = 1
  (0...nums.size).each do |i|
    (0...nums.size).each do |j|
      if i != j
        temp *= nums[j]
      end
    end
    result[i] = temp
    temp = 1
  end
  result
end

# Su dung prefix va suffix
def product_of_array_except_selft_v1(nums)
  result = Array.new(nums.size, 1)

  prefix, suffix = 1, 1

  (0...nums.size).each do |i|
    result[i] = prefix
    prefix *= nums[i]
  end

  (nums.size-1).downto(0) do |i|
    result[i] *= suffix
    suffix *= nums[i]
  end
  result
end

# Example
nums = [1, 2, 4, 6]
puts product_of_array_except_self(nums).inspect

puts product_of_array_except_selft_v1(nums).inspect
