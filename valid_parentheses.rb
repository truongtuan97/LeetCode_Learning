def is_valid(s)
  stack = []
  mapping = { '{' => '}', '[' => ']', '(' => ')' }
  s.each_char do |char|
    if mapping.keys.include?(char)
      stack.push(char)
    else
      return false if stack.empty?
      top = stack.pop
      return false if mapping[top] != char
    end
  end
  stack.empty?
end

puts is_valid("()")        # true
puts is_valid("()[]{}")    # true
puts is_valid("(]")        # false
puts is_valid("([)]")      # false
puts is_valid("{[]}")      # true
