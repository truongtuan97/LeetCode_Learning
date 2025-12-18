def word_ladder(begin_word, end_word, word_list)
  # tra ve rong neu word_list khong chua end_word
  return [] if !word_list.include?(end_word)

  # tao mot pattern mapping
  pattern_map = Hash.new { |h, k| h[k] = [] }
  word_list.each do |word|
    (0...word.length).each do |i|
      pattern = word[0...i] + "*" + word[i + 1..-1]
      pattern_map[pattern] << word
    end
  end

  # tao mot queue de chua word ma chua duoc check
  queue = [begin_word]
  visited = {begin_word => true}
  parent = {} # chua path

  until queue.empty?
    current = queue.shift
    (0...current.length).each do |i|
      pattern = current[0...i] + "*" + current[i + 1..-1]
      pattern_map[pattern].each do |next_word|
        next if visited[next_word] == true

        visited[next_word] = true
        parent[next_word] = current

        return build_path(parent, begin_word, end_word) if next_word == end_word

        queue << next_word
      end
      pattern_map[pattern] = []
    end
  end
  []
end

def build_path(parent, begin_word, end_word)
  puts parent
  path = [end_word]
  while path.last != begin_word
    path << parent[path.last]
    puts "----path: #{path}"
  end
  path.reverse!
end

# ================== TEST ==================
puts "*" * 70
begin_word = "cold"
end_word = "warm"
word_list = ["cord", "card", "ward", "warm", "sold", "told", "bold", "bard", "barn"]

result = word_ladder(begin_word, end_word, word_list)
puts "RESULT:"
p result
