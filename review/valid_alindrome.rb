def valid_palindrome?(s)
  s = s.downcase.gsub(/[^a-z0-9]/, "")
  return true if s.size == 0 || s.size == 1

  left = 0
  right = s.size - 1

  while left < right
    if s[left] != s[right]
      puts "#{s[left]} - #{s[right]}"
      return false
    end
    left += 1
    right -= 1
  end
  true
end

# Example
s = "Was it a car or a cat I saw?"
puts valid_palindrome?(s)

s = "tab a cat"
puts valid_palindrome?(s)