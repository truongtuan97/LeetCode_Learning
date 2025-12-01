require_relative 'print_linked_list_util'
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

# def merge_k_lists(lists)
#   lists = lists.compact
#   merged = lists[0]

#   (1...lists.size).each do |i|
#     merged = merge_two_list(merged, lists[i])
#   end
#   merged
# end

def merge_k_lists(lists)
  return nil if lists.empty?
  return lists[0] if lists.size == 1

  mid = lists.size / 2
  left = merge_k_lists(lists[0...mid])
  right = merge_k_lists(lists[mid...lists.size])

  merge_two_list(left, right)
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
print_list(result) # => 1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6 -> nil