def subsets(nums)
  dp = [[]]
  nums.each do |num|
    new_subsets = []
    puts "dp: #{dp}"
    dp.each do |subset|
      new_subsets << (subset + [num])
    end
    dp += new_subsets
  end
  dp
end

# Ví dụ
nums = [1,2,3]
result = subsets(nums)
puts "Các tập con của #{nums}:"
result.each { |s| p s }