def longest_palindrome(s)
  max_length = 0
  start = 0
  (0...s.length).each do |i|
    l1, r1 = expand(s, i, i)
    if r1 - l1 + 1 > max_length
      start, max_length = l1, r1 - l1 + 1
    end

    l2, r2 = expand(s, i, i+1)
    if r2 - l2 + 1 > max_length
      start, max_length = l1, r2 - l2 + 1
    end
  end
  s[start, max_length]
end

def expand(s, left, right)
  while left >=0 && right < s.length && s[left] == s[right]
    left -= 1
    right += 1
  end
  [left + 1, right - 1]
end

puts longest_palindrome("babad") # => "bab" hoặc "aba"
puts longest_palindrome("cbbd")  # => "bb"