def min_distance(word1, word2)
  m = word1.size
  n = word2.size

  dp = Array.new(m+1) { Array.new(n+1,  0) }

  (0..m).each { |i| dp[i][0] = i }
  (0..n).each { |j| dp[0][j] = j }

  (1..m).each do |i|
    (1..n).each do |j|
      if word1[i-1] == word2[j-1]
        dp[i][j] = dp[i-1][j-1]
      else
        dp[i][j] = 1 + [
          dp[i-1][j],
          dp[i][j-1],
          dp[i-1][j-1]
        ].min
      end
    end
  end
  puts "dp: #{dp}"
  dp[m][n]
end

def edit_distance_with_path(word1, word2)
  m = word1.length
  n = word2.length

  dp = Array.new(m + 1) { Array.new(n + 1, 0) }

  # base cases
  (0..m).each { |i| dp[i][0] = i }
  (0..n).each { |j| dp[0][j] = j }

  # fill dp
  (1..m).each do |i|
    (1..n).each do |j|
      dp[i][j] = if word1[i - 1] == word2[j - 1]
                   dp[i - 1][j - 1]
                 else
                   1 + [
                     dp[i - 1][j],     # delete
                     dp[i][j - 1],     # insert
                     dp[i - 1][j - 1]  # replace
                   ].min
                 end
    end
  end

  # reconstruct operations
  i = m
  j = n
  result = word1.dup
  ops = []

  while i > 0 || j > 0
    if i > 0 && j > 0 && word1[i-1] == word2[j-1]
      i -= 1
      j -= 1
    elsif i > 0 && dp[i][j] == (dp[i-1][j] + 1)
      ops << "Delete '#{result[i-1]}' at position: #{i-1}}"
      result.slice!(i-1)
      i -= 1
    elsif j > 0 && dp[i][j] == dp[i][j-1] + 1 
      ops << "Insert '#{word2[j-1]}' at position: #{i}"
      result.insert(i, word2[j-1])
      j -= 1
    else
      ops << "Replace '#{result[i-1]}' with '#{word2[j-1]}' at position #{i-1}"
      result[i-1] = word2[j-1]
      i -= 1
      j -= 1
    end
  end

  [dp[m][n], result, ops.reverse]
end

distance, final_word, steps = edit_distance_with_path('ab', 'acb')
puts "Edit distance: #{distance}"
puts "Final word1 after transform: #{final_word}"
puts 'Steps:'
steps.each { |s| puts "- #{s}" }

puts "*" * 20
distance, final_word, steps = edit_distance_with_path('horse', 'ros')
puts "Edit distance: #{distance}"
puts "Final word1 after transform: #{final_word}"
puts 'Steps:'
steps.each { |s| puts "- #{s}" }

puts "=" * 10
puts min_distance('horse', 'ros')
