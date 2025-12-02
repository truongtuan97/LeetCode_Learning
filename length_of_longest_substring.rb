require "set"
def length_of_longest_substring(s)
  seen = Set.new
  max_length = 0
  left = 0
  s.chars.each_with_index do |c, i|
    while seen.include?(c)
      seen.delete(c)
      left += 1
    end
    seen.add(c)
    max_length = [max_length, i-left+1].max
  end
  return max_length, seen
end

max, seen = length_of_longest_substring("abcacbdbb")
puts "Max: #{max}" # => 4
puts "Seen: #{seen.inspect}" # => {"a", "c", "d", "b"}

max, seen = length_of_longest_substring("abcdefghijklmnopqrstuvwxyza")
puts "Max: #{max}" # => 26
puts "Seen: #{seen.inspect}"