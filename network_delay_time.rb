def network_delay_time(times, n, k)
  graph = Hash.new { |h, k| h[k] = [] }
  times.each do |u, v, w|
    graph[u] << [v, w]
  end

  dist = Array.new(n + 1, Float::INFINITY)
  dist[k] = 0
  pq = [[0, k]]

  until pq.empty?
    pq.sort_by! { |time, _| time }
    time, node = pq.shift

    graph[node].each do |v, w|
      if dist[v] > time + w
        dist[v] = time + w
        puts "dist[#{v}]: #{dist[v]}"
        pq << [dist[v], v]
      end
    end
  end
  max_time = dist[1..n].max
  (max_time == Float::INFINITY) ? -1 : max_time
end

# Ví dụ test
times = [[2, 1, 1], [2, 3, 1], [3, 4, 1]]
n = 4
k = 2
puts network_delay_time(times, n, k) # => 2
