def eval_rpn(tokens)
  stack = []
  operators = ["+", "-", "*", "/"]

  tokens.each do |token|
    if operators.include?(token)
      b = stack.pop
      a = stack.pop
      result = case token
                when "+" then a + b
                when "-" then a - b
                when "*" then a * b
                when "/" then (a.to_f / b).truncate
              end
      stack.push(result)
    else
      stack.push(token.to_i)
    end
  end
  stack[0]
end

puts eval_rpn(["2", "1", "+", "3", "*"])       # => 9
puts eval_rpn(["4", "13", "5", "/", "+"])      # => 6
puts eval_rpn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
# => 22
