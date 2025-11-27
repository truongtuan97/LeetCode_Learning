def print_list(head)
  curr = head
  while curr
    print "#{curr.val} -> "
    curr = curr.next
  end
  puts "nil"
end