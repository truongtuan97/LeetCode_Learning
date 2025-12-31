class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def lowest_common_ancestor(root, p, q)
  return nil if root.nil?

  if p.val < root.val && q.val < root.val
    lowest_common_ancestor(root.left, p, q)
  elsif p.val > root.val && q.val > root.val
    lowest_common_ancestor(root.right, p, q)
  else
    root
  end
end

# ====== TEST ====== 
root = TreeNode.new(6) 
root.left = TreeNode.new(2) 
root.right = TreeNode.new(8) 
root.left.left = TreeNode.new(0) 
root.left.right = TreeNode.new(4) 
root.right.left = TreeNode.new(7) 
root.right.right = TreeNode.new(9) 
root.left.right.left = TreeNode.new(3) 
root.left.right.right = TreeNode.new(5) 
p = root.left # node 2 
q = root.left.right # node 4 
ancestor = lowest_common_ancestor(root, p, q) 
puts "LCA of #{p.val} and #{q.val} is: #{ancestor.val}" # => 2