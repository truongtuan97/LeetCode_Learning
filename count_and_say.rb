def count_and_say(n)
  result = "1"

  (n - 1).times do    
    result = result.chars
                   .chunk_while { |a, b| a == b }
                   .map { |group| "#{group.size}#{group.first}" }
                   .join                   
  end

  result
end
puts count_and_say(5)