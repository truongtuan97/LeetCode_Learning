def is_palindrome(s)
  s = s.downcase.gsub(/[^0-9a-z]/, '')
  left, right = 0, s.length - 1
  while left < right
    return false if s[left] != s[right]
    left += 1
    right -= 1
  end
  true
end

puts is_palindrome("ca ma ma ca")
puts is_palindrome("na a an")