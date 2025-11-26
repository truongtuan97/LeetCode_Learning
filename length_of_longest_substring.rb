require "set"
def length_of_longest_substring(s)
  seen = Set.new
  left = 0
  max = 0
  s.chars.each_with_index do |char, index|
    if seen.include?(char)
      seen.delete(char)
      left += 1
    end
    seen.add(char)
    max = [max, index - left + 1].max
  end
  return max, seen
end

max, seen = length_of_longest_substring("abcacbdbb")
puts "Max: #{max}" # => 4
puts "Seen: #{seen.inspect}" # => {"a", "c", "d", "b"}