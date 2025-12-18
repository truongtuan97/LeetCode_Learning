def num_islands_dfs(grid)
  return 0 if grid.empty?

  rows = grid.length
  cols = grid[0].length
  count = 0

  dfs = lambda do |r, c|
    return if r < 0 || c < 0 || r >= rows || c >= cols
    return if grid[r][c] == "0"

    grid[r][c] = "0"  # đánh dấu đã thăm

    dfs.call(r + 1, c)
    dfs.call(r - 1, c)
    dfs.call(r, c + 1)
    dfs.call(r, c - 1)
  end

  (0...rows).each do |r|
    (0...cols).each do |c|
      if grid[r][c] == "1"
        count += 1
        dfs.call(r, c)
      end
    end
  end

  count
end

def num_islands_bfs(grid)
  return 0 if grid.empty?

  rows = grid.size
  cols = grid[0].size
  count = 0

  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  (0...rows).each do |r|
    (0...cols).each do |c|
      next if grid[r][c] == "0"
      count += 1
      queue = [[r, c]]
      grid[r][c] = "0"

      until queue.empty?
        x, y = queue.shift

        directions.each do |dx, dy|
          nx = dx + x
          ny = dy + y

          next if nx < 0 || ny < 0 || nx >= rows || ny >= cols
          next if grid[nx][ny] == "0"

          grid[nx][ny] = "0"
          queue << [nx, ny]
        end
      end
    end
  end
  count
end

# Example
grid = [["1", "1", "0", "0", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "1", "0", "0"], ["0", "0", "0", "1", "1"]]
puts num_islands_dfs(grid)

grid = [["1", "1", "0", "0", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "1", "0", "0"], ["0", "0", "0", "1", "1"]]
puts num_islands_bfs(grid)