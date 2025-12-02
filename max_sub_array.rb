def max_sub_array(nums)
  curr_sum, max_sum = 0, 0
  n = nums.size
  start_index, temp_index, end_index = 0, 0, 0

  (0...n).each do |i|
    if nums[i] > curr_sum + nums[i]
      curr_sum = nums[i]
      temp_index = i
    else
      curr_sum += nums[i]
    end

    if curr_sum > max_sum
      max_sum = curr_sum
      start_index = temp_index
      end_index = i
    end
  end

  return max_sum, nums[start_index..end_index]
end

max_sum, nums = max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4])
puts "Max: #{max_sum}" # => 6
puts "Nums: #{nums.inspect}" # => [4,-1,2,1]
