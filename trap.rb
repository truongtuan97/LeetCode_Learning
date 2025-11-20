def trap(height)
  left, right = 0, height.length - 1
  max_left, max_right = 0, 0
  water = 0
  while left < right
    if height[left] < height[right]
      max_left = [max_left, height[left]].max
      water += max_left - height[left]
      left += 1
    else
      max_right = [max_right, height[right]].max
      water += max_right - height[right]
      right -= 1
    end
  end
  water
end

puts trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) # => 6
puts trap([3,0,2,0,4]) # => 7