def longest_palindrome(s)
  max_len = 0
  index = 0
  (0...s.length).each do |i|
    l1, r1 = expand(s, i, i)
    if max_len < r1-l1+1
      max_len = r1-l1+1
      index = l1
    end

    l2, r2 = expand(s, i, i+1)
    if max_len < r2-l2+1
      max_len = r2-l2+1
      index = l2
    end
  end
  s[index, max_len]
end

def expand(s, left, right)
  while left > 0 && right < s.length && s[left] == s[right]
    left -= 1
    right += 1
  end
  return left + 1, right - 1
end
puts longest_palindrome("babad") # => "bab" hoặc "aba"
puts longest_palindrome("cbbd")  # => "bb"