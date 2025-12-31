def is_anagram(s1, s2)
  return s1.chars.sort == s2.chars.sort
end

# Example
s = "racecar" 
t = "carrace"
puts is_anagram(s, t)