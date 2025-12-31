require 'set'
def longest_consecutive_sequence(nums)
  return 0 if nums.size == 0
  num_set = nums.to_set
  best_seq = []

  num_set.each do |num|
    puts "num: #{num}"
    next if num_set.include?(num-1)
    current_seq = [num]
    puts "curr_seq_begin: #{current_seq}"
    while num_set.include?(current_seq.last + 1)
      current_seq << current_seq.last + 1
    end
    puts "cur_seq: #{current_seq.inspect}"
    best_seq = current_seq if current_seq.size > best_seq.size
  end
  best_seq
end

# Example
nums = [2,20,4,10,3,4,5]
puts longest_consecutive_sequence(nums).inspect