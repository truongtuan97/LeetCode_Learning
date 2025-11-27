def daily_temperatures(temperatures)
  stack = []
  n = temperatures.size
  result = Array.new(n, 0)

  temperatures.each_with_index do |temp, i|
    while !stack.empty? && temperatures[stack[-1]] < temp
      prev_index = stack.pop
      result[prev_index] = i - prev_index
    end
    stack.push(i)
  end
  result
end

temps = [73,74,75,71,69,72,76,73]
puts daily_temperatures(temps).inspect
