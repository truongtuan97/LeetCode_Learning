class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def level_order(root)
  return [] if root.nil?

  result = []
  queue = [root]

  until queue.empty?
    level_size = queue.size
    level = []

    level_size.times do
      node = queue.shift
      level << node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end
    result << level
  end
  result
end

# ====== TEST ======
root = TreeNode.new(3)
root.left = TreeNode.new(9)
root.right = TreeNode.new(20)
root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)
puts level_order(root).inspect # => [[3], [9, 20], [15, 7]]
