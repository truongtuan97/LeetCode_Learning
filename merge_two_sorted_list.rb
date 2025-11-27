require_relative "print_linked_list_util"
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def merge_two_list(l1, l2)
  dummy = ListNode.new(0)
  tail = dummy
  while l1 && l2
    if l1.val <= l2.val
      tail.next = l1
      l1 = l1.next
    else
      tail.next = l2
      l2 = l2.next
    end
    tail = tail.next
  end
  tail.next = l1 || l2
  dummy.next
end

l1 = ListNode.new(1)
l1.next = ListNode.new(2)
l1.next.next = ListNode.new(3)

l2 = ListNode.new(1)
l2.next = ListNode.new(2)
l2.next.next = ListNode.new(4)

merged_list = merge_two_list(l1, l2)

print_list(merged_list)