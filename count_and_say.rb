def count_and_say(n)
  result = "1"
  (n-1).times do
    result = result.chars.chunk_while { |a, b| a == b}.map {|group| "#{group.size}#{group.first}"}.join
  end
  result
end

def count_and_say_normal(n)
  result = "1"
  (n-1).times do
    i=0
    current = ""
    while i < result.length
      count = 1
      while i + 1 < result.length && result[i] == result[i+1]
        count += 1
        i += 1
      end
      current << count.to_s << result[i]
      i += 1
    end
    result = current
  end
  result
end

puts count_and_say(5) # => 111221
puts count_and_say_normal(5) # => 111221