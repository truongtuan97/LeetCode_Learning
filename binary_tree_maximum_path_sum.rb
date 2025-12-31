class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def max_path_sum(root)
  _, max_path_sum, best_path = dfs(root)
  [max_path_sum, best_path]
end

def dfs(node)
  return [0, -Float::INFINITY, []] if node.nil?

  left_gain, left_max_sum, left_path = dfs(node.left)
  right_gain, right_max_sum, right_path = dfs(node.right)

  left_gain = [left_gain, 0].max
  right_gain = [right_gain, 0].max

  current_sum = node.val + left_gain + right_gain
  current_path = []
  current_path += left_path if left_gain > 0
  current_path << node.val
  current_path += right_path if right_gain > 0

  if current_sum >= left_max_sum && current_sum >= right_max_sum
    best_sum = current_sum
    best_path = current_path
  elsif left_max_sum > current_sum
    best_sum = left_max_sum
    best_path = left_path
  else
    best_sum = right_max_sum
    best_path = right_path
  end

  if left_gain >= right_gain
    [node.val + left_gain, best_sum, left_path + [node.val]]
  else
    [node.val + right_gain, best_sum, right_path + [node.val]]
  end.tap do |arr|
    arr[1] = best_sum
    arr[2] = best_path
  end
end

# ====== TEST ======
root = TreeNode.new(-10)
root.left = TreeNode.new(9)
root.right = TreeNode.new(20)
root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)
max_path_sum, best_path = max_path_sum(root) # => 42 (15 + 20 + 7)
puts "max_path_sum: #{max_path_sum} ----- beat_path: #{best_path}"
