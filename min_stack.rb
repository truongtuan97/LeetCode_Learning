class MinStack
  def initialize
    @stack = []
    @min_stack = []
  end

  def push(x)
    @stack.push(x)
    if @min_stack.empty? || x <= @min_stack[-1]
      @min_stack.push(x)
    end
  end

  def pop()
    val = @stack.pop
    if val == @min_stack[-1]
      @min_stack.pop
    end
    val
  end

  def top
    @stack[-1]
  end

  def get_min
    @min_stack[-1]
  end
end

min_stack = MinStack.new
min_stack.push(-2)
min_stack.push(0)
min_stack.push(-3)

puts "Min hiện tại: #{min_stack.get_min}"  # => -3
min_stack.pop
puts "Top hiện tại: #{min_stack.top}"      # => 0
puts "Min hiện tại: #{min_stack.get_min}"  # => -2