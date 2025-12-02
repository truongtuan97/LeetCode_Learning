def sub_str(haystack, needle)
  (0...haystack.size - needle.size).each do |i|
    if haystack[i,needle.size] == needle
      return i
    end
  end
  -1
end

puts sub_str("hello", "ll") #=> 2