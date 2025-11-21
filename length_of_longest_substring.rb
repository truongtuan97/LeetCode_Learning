require "set"
def length_of_longest_substring(s)
  seen = Set.new
  left = 0
  max_length = 0
  s.chars.each_with_index do |char, i|
    while seen.include?(char)
      seen.delete(char)
      left += 1
    end
    seen.add(char)
    max_length = [max_length, i - left + 1].max
  end
  return max_length, seen
end

max, seen = length_of_longest_substring("abcacbbb")
puts "Max: #{max}"
puts "Seen: #{seen.inspect}"