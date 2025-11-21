require "set"
def length_of_longest_substring(s)
  seen = Set.new
  max, left = 0,0
  s.chars.each_with_index do |char, move|
    while seen.include?(char)
      seen.delete(char)
      left += 1
    end
    seen.add(char)
    max = [max, move-left+1].max
  end

  return max, seen
end

max, seen = length_of_longest_substring("abcacbdbb")
puts "Max: #{max}"
puts "Seen: #{seen.inspect}"