class MyQueue
  def initialize
    @in_stack = []
    @out_stack = []
  end

  def push(x)
    @in_stack.push(x)
  end

  def pop
    shift_stack
    @out_stack.pop
  end

  def peek
    shift_stack
    @out_stack[-1]
  end
  
  def empty
    @in_stack.empty? && @out_stack.empty?
  end

  private

  def shift_stack
    if @out_stack.empty?
      while !@in_stack.empty?
        @out_stack.push(@in_stack.pop)
      end
    end
  end
end

q = MyQueue.new
q.push(1)
q.push(2)
puts q.peek    # => 1
puts q.pop     # => 1
puts q.empty   # => false
