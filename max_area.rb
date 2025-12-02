def max_area(height)
  max_area = 0
  left, right = 0, height.size - 1
  min_height = height[left]
  while left < right
    min_height = [height[left], height[right]].min
    max_area = [max_area, min_height * (right - left)].max
    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  max_area
end

def max_area_brutforce(height)
  maxArea = 0
  minHeight = height[0]
  n = height.size
  (0...n).each do |i|
    (1...n).each do |j|
      minHeight = [height[i], height[j]].min
      maxArea = [maxArea, minHeight*(j-i)].max
    end
  end
  maxArea
end

puts max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]).inspect # => 49
puts "=" * 70
puts max_area_brutforce([1, 8, 6, 2, 5, 4, 8, 3, 7]).inspect # => 49