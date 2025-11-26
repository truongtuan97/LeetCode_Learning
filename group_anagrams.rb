def group_anagrams(strs)
  groups = Hash.new { |h, k| h[k] = [] }
  strs.each_with_index do |word, index|
    key = word.chars.sort.join
    groups[key] << word
  end
  groups
end

puts group_anagrams(%w[eat tea tan ate nat bat tab]).inspect