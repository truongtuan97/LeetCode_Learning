def is_palindrome(s)
  filtered = s.downcase.gsub(/[^0-9a-z]/, '')
  left, right = 0, filtered.size - 1
  while left < right
    return false if filtered[left] != filtered[right]
    left += 1
    right -= 1
  end
  true
end

puts is_palindrome("Ca ma ma ca")
puts is_palindrome("na a an")