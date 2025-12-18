
require 'set'

def word_ladder_two_end(begin_word, end_word, word_list)
  return [] unless word_list.include?(end_word)

  # Đưa begin_word vào word_list nếu chưa có (để build pattern map đầy đủ)
  word_list = word_list | [begin_word]

  # 1. Build pattern map: co*d -> ["cold", "cord"], *old -> ["cold", "sold", ...]
  pattern_map = Hash.new { |h, k| h[k] = [] }
  word_list.each do |word|
    (0...word.length).each do |i|
      pattern = word[0...i] + "*" + word[i+1..-1]
      pattern_map[pattern] << word
    end
  end

  # 2. Hai phía BFS
  front_begin = Set.new([begin_word])
  front_end   = Set.new([end_word])

  visited_begin = { begin_word => true }
  visited_end   = { end_word => true }

  parent_begin = { begin_word => nil } # child -> parent
  parent_end   = { end_word   => nil }

  level = 0

  while !front_begin.empty? && !front_end.empty?
    level += 1
    puts "===== LEVEL #{level} – EXPAND FROM BEGIN SIDE ====="
    p front_begin.to_a

    # 3. Mở rộng một lớp từ BEGIN side
    meet = expand_one_level(
      side: :begin,
      current_front: front_begin,
      other_front: front_end,
      visited_this: visited_begin,
      visited_other: visited_end,
      parent_this: parent_begin,
      parent_other: parent_end,
      pattern_map: pattern_map
    )

    if meet
      puts ">>> MEET FOUND FROM BEGIN SIDE: #{meet.inspect}"
      return build_full_path(
        begin_word: begin_word,
        end_word: end_word,
        parent_begin: parent_begin,
        parent_end: parent_end,
        meet_info: meet
      )
    end

    level += 1
    puts "===== LEVEL #{level} – EXPAND FROM END SIDE ====="
    p front_end.to_a

    # 4. Mở rộng một lớp từ END side
    meet = expand_one_level(
      side: :end,
      current_front: front_end,
      other_front: front_begin,
      visited_this: visited_end,
      visited_other: visited_begin,
      parent_this: parent_end,
      parent_other: parent_begin,
      pattern_map: pattern_map
    )

    if meet
      puts ">>> MEET FOUND FROM END SIDE: #{meet.inspect}"
      return build_full_path(
        begin_word: begin_word,
        end_word: end_word,
        parent_begin: parent_begin,
        parent_end: parent_end,
        meet_info: meet
      )
    end
  end

  []
end

# side: :begin hoặc :end
# return:
#   nil nếu chưa gặp
#   hash { side:, word_this:, word_other: } nếu gặp
def expand_one_level(side:, current_front:, other_front:, visited_this:, visited_other:,
                     parent_this:, parent_other:, pattern_map:)
  next_front = Set.new

  current_front.each do |word|
    puts "[#{side.upcase}] expand from: #{word}"

    (0...word.length).each do |i|
      pattern = word[0...i] + "*" + word[i+1..-1]

      pattern_map[pattern].each do |next_word|
        puts "    pattern #{pattern} -> candidate #{next_word} (side: #{side})"

        # Nếu candidate nằm trong front bên kia → hai phía chạm nhau
        if other_front.include?(next_word) || visited_other[next_word]
          puts "    >>> MEET at #{next_word} (this: #{word}, side: #{side})"
          return {
            side: side,          # :begin hay :end
            word_this: word,     # node ở phía hiện tại
            word_other: next_word # node ở phía còn lại
          }
        end

        # Nếu chưa thăm ở phía này → thêm vào frontier
        next if visited_this[next_word]

        visited_this[next_word] = true
        parent_this[next_word]  = word
        next_front.add(next_word)
      end
    end
  end

  # Cập nhật frontier
  current_front.clear
  next_front.each { |w| current_front.add(w) }

  nil
end

def build_chain(parent_map, from, root)
  path = [from]
  cur = from
  while cur != root
    cur = parent_map[cur]
    raise "Broken parent chain from #{from} to #{root}" if cur.nil?
    path << cur
  end
  path.reverse
end

# meet_info: { side:, word_this:, word_other: }
def build_full_path(begin_word:, end_word:, parent_begin:, parent_end:, meet_info:)
  side       = meet_info[:side]
  word_this  = meet_info[:word_this]
  word_other = meet_info[:word_other]

  puts "=== BUILD PATH ==="
  puts "side       = #{side}"
  puts "word_this  = #{word_this}"
  puts "word_other = #{word_other}"

  if side == :begin
    # Đang mở rộng phía BEGIN, gặp word_other ở phía END
    # chain_begin: begin -> ... -> word_this
    chain_begin = build_chain(parent_begin, word_this, begin_word)
    # chain_end: word_other -> ... -> end
    chain_end   = build_chain(parent_end, word_other, end_word)

    # Ghép: begin ... word_this -> word_other ... end
    full = chain_begin + [word_other] + chain_end[1..]
  else
    # Đang mở rộng phía END, gặp word_other ở phía BEGIN
    # chain_begin: begin -> ... -> word_other
    chain_begin = build_chain(parent_begin, word_other, begin_word)
    # chain_end: word_this -> ... -> end
    chain_end   = build_chain(parent_end, word_this, end_word)

    # Ghép: begin ... word_other -> word_this ... end
    full = chain_begin + [word_this] + chain_end[1..]
  end

  puts "FULL PATH: #{full.inspect}"
  full
end

# ================== TEST ==================
puts "*" * 70
begin_word = "cold"
end_word   = "warm"
word_list  = ["cord", "card", "ward", "warm", "sold", "told", "bold", "bard", "barn"]

result = word_ladder_two_end(begin_word, end_word, word_list)
puts "RESULT:"
p result
