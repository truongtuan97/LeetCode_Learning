def sub_str(haystack, needle)
  (0...haystack.length - needle.length).each do |index|
    return index if haystack[index, needle.length] == needle 
  end
  -1
end

puts sub_str("hello", "ll") #=> 2