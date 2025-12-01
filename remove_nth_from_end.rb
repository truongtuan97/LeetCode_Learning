require_relative 'print_linked_list_util'
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def remove_nth_from_end(head, n)
  dummy = ListNode.new(0, head)
  slow = dummy
  fast = dummy
  (n+1).times do
    fast = fast.next
  end
  while fast
    slow = slow.next
    fast = fast.next
  end
  slow.next = slow.next.next

  dummy.next
end

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)
head.next.next.next = ListNode.new(4)
head.next.next.next.next = ListNode.new(5)

puts "Danh sách ban đầu:"
print_list(head)

# Xóa node thứ 2 từ cuối
head = remove_nth_from_end(head, 2)

puts "Danh sách sau khi xóa:"
print_list(head)