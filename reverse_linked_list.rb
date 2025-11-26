class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def reverse(head)
  prev = nil
  curr = head
  while curr
    nxt = curr.next
    curr.next = prev
    prev = curr
    curr = nxt
  end
  prev
end

def print_list(head)
  curr = head
  while curr
    print "#{curr.val} -> "
    curr = curr.next
  end
  puts "nil"
end

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)

puts "Before reverse: "
print_list(head)

reverse = reverse(head)
puts "After reverse: "
print_list(reverse)