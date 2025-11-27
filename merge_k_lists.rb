require_relative 'print_linked_list_util'
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def merge_two_lists(l1, l2)
  dummy = ListNode.new(0)
  tail = dummy

  while l1 && l2
    if l1.val < l2.val
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

def merge_k_lists(lists)
  return nil if lists.empty?

  while lists.size > 1
    merged = []
    (0...lists.size).step(2) do |i|
      l1 = lists[i]
      l2 = (i+1 < lists.size) ? lists[i+1] : nil
      merged << merge_two_lists(l1, l2)
    end
    lists = merged
  end
  lists[0]
end

# Tạo list1: 1 -> 4 -> 5
l1 = ListNode.new(1)
l1.next = ListNode.new(4)
l1.next.next = ListNode.new(5)

# Tạo list2: 1 -> 3 -> 4
l2 = ListNode.new(1)
l2.next = ListNode.new(3)
l2.next.next = ListNode.new(4)

# Tạo list3: 2 -> 6
l3 = ListNode.new(2)
l3.next = ListNode.new(6)

lists = [l1, l2, l3]

puts "Kết quả merge:"
result = merge_k_lists(lists)
print_list(result)