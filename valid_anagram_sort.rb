def valid_anagram_sort(s, t)
  return false if s.length != t.length
  return s.chars.sort == t.chars.sort
end

puts valid_anagram_sort("tan", "nat")
puts valid_anagram_sort("tan", "hoang")

def valid_anagram_count(s, t)
  return false if s.length != t.length

  count = Hash.new(0)
  s.chars.each { |c| count[c] += 1 }
  t.chars.each { |c| count[c] -= 1 }

  count.values.all? { |v| v == 0 }
end

puts valid_anagram_count("tan", "nat")
puts valid_anagram_count("tan", "hoang")