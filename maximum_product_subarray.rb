def max_product(nums)
  max_prod, min_prod = nums[0], nums[0]
  ans = nums[0]

  (1...nums.size).each do |i|
    n = nums[i]

    if n < 0
      max_prod, min_prod = min_prod, max_prod
    end

    if max_prod * n < n
      max_prod = n
    else
      max_prod *= n
    end

    if min_prod * n > n
      min_prod = n
    else
      min_prod *= n
    end

    if ans < max_prod
      ans = max_prod
    end
  end
  ans
end

def max_product_with_subarray(nums)
  max_prod = nums[0]
  min_prod = nums[0]
  ans = nums[0]

  max_start, min_start = 0, 0
  best_start, best_end = 0, 0

  (1...nums.size).each do |i|
    n = nums[i]
    if n < 0
      max_prod, min_prod = min_prod, max_prod
      max_start, min_start = min_start, max_start
    end

    if n > max_prod * n
      max_prod = n
      max_start = i
    else
      max_prod *= n
    end

    if n < min_prod * n
      min_prod = n
      min_start = i
    else
      min_prod *= n
    end

    if ans < max_prod
      ans = max_prod
      best_start = max_start
      best_end = i
    end
  end

  [ans, nums[best_start..best_end]]
end

# Example
nums = [2, 3, -2, 4]
puts max_product(nums)

nums = [2, 3, -2, -5, 4]
puts max_product(nums)

puts "*" * 40
# Example
nums = [3, 2, -3, -2, -5, 4]
product, subarray = max_product_with_subarray(nums)

puts "Maximum product: #{product}"
puts "Subarray: #{subarray.inspect}"

nums = [2, 3, -2, 4]
product, subarray = max_product_with_subarray(nums)

puts "Maximum product: #{product}"
puts "Subarray: #{subarray.inspect}"
