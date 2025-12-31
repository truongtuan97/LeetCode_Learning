def group_anagram(arr_string)
  hash_array = Hash.new { |h, k| h[k] = [] }

  arr_string.each do |el|
    key = el.chars.sort!.join
    hash_array[key] << el
  end

  hash_array.values
end

# Example
strs = ["act", "pots", "tops", "cat", "stop", "hat"]
puts group_anagram(strs).inspect

strs = ["x"]
puts group_anagram(strs).inspect