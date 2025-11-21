def sub_str(haystack, needle)
  (0...haystack.length - needle.length).each do |i|
    return i if haystack[i, needle.length] == needle
  end
  -1
end

puts sub_str("hello", "ll") #=> 2