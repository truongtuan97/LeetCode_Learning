def can_finish_dfs(num_courses, prerequisites)
  graph = Array.new(num_courses) { [] }
  prerequisites.each do |a, b|
    graph[b] << a
  end

  state = Array.new(num_courses, 0)

  dfs = lambda do |course|
    return false if state[course] == 1
    return true if state[course] == 2

    state[course] = 1

    graph[course].each do |next_course|
      return false unless dfs.call(next_course)
    end

    state[course] = 2
    true
  end

  (0...num_courses).each do |course|
    return false unless dfs.call(course)
  end
  true
end

def can_finish_bfs(num_courses, prerequisites)
  graph = Array.new(num_courses) { [] }
  indegree = Array.new(num_courses, 0)

  prerequisites.each do |a, b|
    graph[b] << a
    indegree[a] += 1
  end

  queue = []

  indegree.each_with_index do |deg, i|
    queue << i if deg == 0
  end

  count = 0

  until queue.empty?
    course = queue.shift
    count += 1
    graph[course].each do |next_course|
      indegree[next_course] -= 1
      queue << next_course if indegree[next_course] == 0
    end
  end

  count == num_courses
end

num_courses = 4
prerequisites = [[1, 0], [2, 1], [3, 2]]
puts can_finish_dfs(num_courses, prerequisites)
