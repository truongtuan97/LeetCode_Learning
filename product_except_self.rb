# giai thuat: tich cac phan tu ben trai * tich cac phan tu ben phai
def product_except_self(nums)
  results = Array.new(nums.size, 1)
  left, right = 1, 1
  (0...nums.size).each do |i|
    results[i] = left
    left *= nums[i]
  end
  (nums.size - 1).downto(0) do |i|
    results[i] *= right
    right *= nums[i]
  end
  results
end

puts product_except_self([1, 2, 3, 4]).inspect # => [24, 12, 8, 6]
puts product_except_self([1, 0, 3, 4]).inspect  # [0, 12, 4, 3]