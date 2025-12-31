class NestedIterator
  def initialize(nested_list)
    @flatterned = []
    flattern(nested_list)
    @index = 0
  end

  def flattern(nested_list)
    nested_list.each do |el|
      if el.is_integer?
        @flatterned << el.get_integer
      else
        flattern(el.get_list)
      end
    end
  end

  def next
    val = @flatterned[@index]
    @index += 1
    val
  end

  def has_nested
    @index < @flatterned.size
  end
end

# Giả sử ta có 
nested_list = [[1,1],2,[1,1]]
# Kết quả flatten sẽ là [1,1,2,1,1]

i = NestedIterator.new(nested_list)
result = []
while i.has_next
  result << i.next
end
puts result.inspect
# => [1, 1, 2, 1, 1]
