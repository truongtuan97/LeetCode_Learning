require_relative 'print_linked_list_util'
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def add_two_numbers(l1, l2)
  dummy = ListNode.new(0)
  curr = dummy
  carry = 0

  while l1 || l2 || carry > 0
    val1 = l1 ? l1.val : 0
    val2 = l2 ? l2.val : 0
    sum = val1 + val2 + carry
    carry = sum / 10

    curr.next = ListNode.new(sum%10)
    curr = curr.next

    l1 = l1.next if l1
    l2 = l2.next if l2
  end
  
  dummy.next
end
# Tạo số 342: 2 -> 4 -> 3
l1 = ListNode.new(2)
l1.next = ListNode.new(4)
l1.next.next = ListNode.new(3)

# Tạo số 465: 5 -> 6 -> 4
l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next.next = ListNode.new(4)

puts "Số 1:"
print_list(l1)
puts "Số 2:"
print_list(l2)

result = add_two_numbers(l1, l2)

puts "Kết quả cộng: should be 7 -> 0 -> 8"
print_list(result)