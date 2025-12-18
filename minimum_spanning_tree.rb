class UnionFind
  def initialize(n)
    @parent = Array.new(n) { |i| i }
    @rank = Array.new(n, 0)
  end

  def find(x)
    if @parent[x] != x
      @parent[x] = find(@parent[x])
    end
    @parent[x]
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)

    return false if root_x == root_y # cung nhom

    if @rank[root_x] < @rank[root_y]
      @parent[root_x] = root_y
    elsif @rank[root_x] > @rank[root_y]
      @parent[root_y] = root_x
    else
      @parent[root_y] = root_x
      @rank[root_x] += 1
    end
  end
end

def kruskal_mst(n, edges)
  # edges: array of [u, v, w] 
  # n: số đỉnh 
  # B1: sắp xếp cạnh theo trọng số tăng dần
  edges.sort_by! { |_, _, w| w }

  uf = UnionFind.new(n)
  mst_edges = []
  total_weight = 0

  edges.each do |u, v, w|
    # Nếu u và v chưa cùng nhóm, thêm cạnh này vào MST
    if uf.union(u, v)
      mst_edges << [u, v, w]
      total_weight += w
    end
  end

  [mst_edges, total_weight]
end

require 'set'

def prim_mst(n, graph)
  visited = Array.new(n, false)
  total_weight = 0
  mst_edges = []

  pq = []
  start = 0
  visited[start] = true

  graph[start].each do |(v, w)|
    pq << [w, start, v]
  end

  while mst_edges.size < n - 1 && !pq.empty?
    pq.sort_by! { |w, _, _| w }
    w, u, v = pq.shift

    next if visited[v]

    visited[v] = true
    mst_edges << [u, v, w]
    total_weight += w

    graph[v].each do |(to, wt)|
      pq << [wt, v, to] unless visited[to]
    end
  end

  [mst_edges, total_weight]
end

# Build adjacency list từ danh sách cạnh
def build_graph(n, edges)
  graph = Array.new(n) { [] }
  edges.each do |u, v, w|
    graph[u] << [v, w]
    graph[v] << [u, w]  # vì là đồ thị vô hướng
  end
  graph
end

# # Example
# n = 5
# edges = [ [0,1,4], [0,2,2], [1,2,1], [1,3,5], [2,3,8], [2,4,10], [3,4,2] ]

# mst_edges, total_weight = kruskal_mst(n, edges)
# puts "Edges: #{mst_edges.inspect}"
# puts "Total weight: #{total_weight}"

# ====== TEST ======
n = 5
edges = [
  [0,1,4],
  [0,2,2],
  [1,2,1],
  [1,3,5],
  [2,3,8],
  [2,4,10],
  [3,4,2]
]

graph = build_graph(n, edges)

mst_edges, total_weight = prim_mst(n, graph)
puts "Edges: #{mst_edges.inspect}"
puts "Total weight: #{total_weight}"