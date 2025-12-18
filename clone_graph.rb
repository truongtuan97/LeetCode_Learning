def clone_graph_dfs(node)
  return nil if node.nil?

  visited = {}  # map: old_node => new_node

  dfs = lambda do |old|
    # Nếu node này đã clone rồi, trả về bản clone
    return visited[old] if visited.key?(old)

    # Tạo node mới (chưa có neighbors)
    new_node = Node.new(old.val)
    visited[old] = new_node

    # Clone neighbors bằng DFS
    old.neighbors.each do |nei|
      new_node.neighbors << dfs.call(nei)
    end

    new_node
  end

  dfs.call(node)
end

def clone_graph_bfs(node)
  return nil if node.nil?

  # Hash map: old_node => new_node
  visited = {}

  # Tạo bản clone đầu tiên
  clone_start = Node.new(node.val)
  visited[node] = clone_start

  # Queue BFS
  queue = [node]

  until queue.empty?
    current = queue.shift

    # Duyệt tất cả neighbors của node hiện tại
    current.neighbors.each do |nei|
      # Nếu neighbor chưa clone → clone và đưa vào queue
      unless visited.key?(nei)
        visited[nei] = Node.new(nei.val)
        queue << nei
      end

      # Thêm neighbor clone vào neighbors của node clone hiện tại
      visited[current].neighbors << visited[nei]
    end
  end

  clone_start
end
