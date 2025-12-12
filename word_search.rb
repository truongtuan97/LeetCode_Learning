def exists(board, word)
  rows = board.size
  cols = board[0].size

  dfs = lambda do |i, j, index, path|
    return true if index == word.size
    return false if i < 0 || j < 0 || i >= rows || j >= cols
    return false if board[i][j] != word[index]

    temp = board[i][j]
    path << board[i][j]
    board[i][j] = '#'

    found = dfs.call(i + 1, j, index + 1, path) ||
            dfs.call(i - 1, j, index + 1, path) ||
            dfs.call(i, j + 1, index + 1, path) ||
            dfs.call(i, j - 1, index + 1, path)

    path.pop if found == false
    board[i][j] = temp

    found
  end

  path = []
  (0...rows).each do |i|
    (0...cols).each do |j|
      dfs.call(i, j, 0, path)

      if path.size > 0
        puts "===== #{path.inspect}"
        return true
      end
    end
  end
  false
end

board = [
  %w[A B C E],
  %w[S F C S],
  %w[A D E E]
]

p exists(board, 'ABCCED')  # true
p exists(board, 'SEE')     # true
p exists(board, 'ABCB')    # false
