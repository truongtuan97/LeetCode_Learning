def encode(strings)
  encoded = ""
  strings.each do |str|
    encoded += "#{str.length}##{str}"
  end
  encoded
end

def decode(str)
  result = []
  i = 0
  while i < str.length
    j = i
    j += 1 while str[j] != '#'
    
    number = str[i,j].to_i
    puts "i: #{i} - j: #{j} - number: #{number}"
    result << str[j+1, number]
    i = number + j + 1
  end
  result
end

# Example
strs = ["we","say",":","yes"]
encoded = encode(strs)
puts "Encoded: #{encoded}"
decoded = decode(encoded)
puts "Decoded: #{decoded.inspect}"
