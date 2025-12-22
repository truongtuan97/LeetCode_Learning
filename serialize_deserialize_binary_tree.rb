class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class Codec
  def serialize(root)
    return "#" if root.nil?
    "#{root.val},#{serialize(root.left)},#{serialize(root.right)}"
  end

  def deserialize(data)
    nodes = data.split(",")
    nodes.map! { |node| node.strip }
    build(nodes)
  end

  private

  def build(nodes)
    val = nodes.shift
    return nil if val == "#"
    root = TreeNode.new(val.to_i)
    root.left = build(nodes)
    root.right = build(nodes)
    root
  end
end

class CodecBFS
  def serialize(root)
    return "#" if root.nil?
    result = []
    queue = [root]
    until queue.empty?
      node = queue.shift
      if node
        queue << node.left
        queue << node.right
        result << node.val
      else
        result << "#"
      end
    end
    result.join(",")
  end

  def deserialize(data)
    return nil if data.empty?
    nodes = data.split(",")
    val = nodes.shift
    root = TreeNode.new(val.to_i)
    queue = [root]

    until queue.empty?
      node = queue.shift
      left_val = nodes.shift
      right_val = nodes.shift

      if left_val && left_val != "#"
        node.left = TreeNode.new(left_val.to_i)
        queue << node.left
      end

      if right_val && right_val != "#"
        node.right = TreeNode.new(right_val.to_i)
        queue << node.right
      end
    end
    root
  end
end

# ====== TEST ======
root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.right.left = TreeNode.new(4)
root.right.right = TreeNode.new(5)

codec = Codec.new
s = codec.serialize(root)
puts "Serialized: #{s}"
tree = codec.deserialize(s)
puts "Deserialize -> Serialize again: #{codec.serialize(tree)}"

# https://venturedive.applytojob.com/
# Example BFS
root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.right.left = TreeNode.new(4)
root.right.right = TreeNode.new(5)

codec = CodecBFS.new
s = codec.serialize(root)
puts "Serialized: #{s}"
tree = codec.deserialize(s)
puts "Deserialize -> Serialize again: #{codec.serialize(tree)}"
