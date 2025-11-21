def reverse_string(s)
  left, right = 0, s.length - 1

  while left < right
    s[left], s[right] = s[right], s[left]
    left += 1
    right -= 1
  end
  s
end

puts reverse_string("Hello world") # => dlrow olleH
puts reverse_string("camel") # => lemac 