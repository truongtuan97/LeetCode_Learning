def max_area(height)
  max_area = 0
  left, right = 0, height.length - 1
  
  while left < right
    h = [height[left], height[right]].min
    max_area = [max_area, h * (right - left)].max
    if height[left] < height[right]      
      left += 1
    else
      right -= 1
    end
  end
  max_area
end

puts max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]).inspect
