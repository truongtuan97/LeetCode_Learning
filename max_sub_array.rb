def max_sub_array(nums)
  cur_sum, max_sum = 0, 0
  start_index, end_index, temp_index = 0, 0, 0
  (0...nums.length).each do |index|
    if nums[index] > cur_sum + nums[index]
      cur_sum = nums[index]
      temp_index = index
    else
      cur_sum += nums[index]
    end

    if cur_sum > max_sum
      max_sum = cur_sum
      end_index = index
      start_index = temp_index
    end
  end

  return max_sum, nums[start_index..end_index]
end

max_sum, nums = max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
puts "Max: #{max_sum}" # => 6
puts "Nums: #{nums.inspect}" # => [4,-1,2,1]