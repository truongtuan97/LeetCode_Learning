def combination_sum(candidates, target)
  dp = Array.new(target + 1) { [] }
  dp[0] = [[]]
  candidates.each do |can|
    (can..target).each do |t|
      dp[t - can].each do |comb|
        dp[t] << (comb + [can])
      end
    end
  end
  dp[target]
end

def combination_sum_top_down(candidates, target)
  memo = []
  dfs = lambda do |remain, start, path|
    if remain == 0
      memo << path
      return
    end
    return if remain < 0

    (start...candidates.size).each do |i|
      can = candidates[i]
      path << can
      dfs.call(remain - can, i, path)
      path.pop
    end
  end

  dfs.call(target, 0, memo)
  memo
end
# Ví dụ
candidates = [2, 3, 6, 7]
target = 7
result = combination_sum(candidates, target)
puts "Các tổ hợp có tổng bằng #{target}:"
result.each { |comb| p comb }

candidates = [2, 3, 6, 7]
target = 7
result = combination_sum_top_down(candidates, target)
puts "Các tổ hợp có tổng bằng #{target}:"
result.each { |comb| p comb }
