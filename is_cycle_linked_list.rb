class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def is_cycle_linked_list(head)
  slow = head
  fast = head

  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
    if slow == fast
      return true
    end
  end
  false
end

head = ListNode.new(3)
head.next = ListNode.new(2)
head.next.next = ListNode.new(0)
head.next.next.next = ListNode.new(-4)

head.next.next.next.next = head.next

puts "Is cycle linked list: #{is_cycle_linked_list(head)}"
