class TrieNode
  attr_accessor :children, :word

  def initialize
    @children = {}
    @word = nil
  end
end

def build_trie(words)
  root = TrieNode.new

  words.each do |w|
    node = root
    w.each_char do |ch|
      node.children[ch] = TrieNode.new
      node = node.children[ch]
    end
    node.word = w
  end
  root
end

def find_word(board, words)
  return [] if board.empty? || board[0].empty?

  root = build_trie(words)
  rows = board.length
  cols = board[0].length
  results = []

  dfs = lambda do |i, j, node|
    ch = board[i][j]
    return if ch == '#' || !node.children.key?(ch)

    next_node = node.children[ch]

    if next_node.word
      results << next_node.word
      next_node.word = nil
    end

    board[i][j] = '#'
    dfs.call(i - 1, j, next_node) if i > 0
    dfs.call(i + 1, j, next_node) if i < rows - 1
    dfs.call(i, j - 1, next_node) if j > 0
    dfs.call(i, j + 1, next_node) if j < cols - 1
    board[i][j] = ch
  end

  (0...rows).each do |i|
    (0...cols).each do |j|
      dfs.call(i, j, root)
    end
  end
  results
end

# Ví dụ chạy thử
board = [
  %w[o a a n],
  %w[e t a e],
  %w[i h k r],
  %w[i f l v]
]

words = %w[oath pea eat rain]

p find_word(board, words) # => ["oath", "eat"]
