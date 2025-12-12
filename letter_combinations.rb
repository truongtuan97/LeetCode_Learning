def letter_combinations(digits)
  return [] if digits.empty?

  phones = {
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }
  results = []

  dfs(digits, phones, results, 0, [])
  results
end

def dfs(digits, phones, results, index, path)
  if index == digits.size
    results << path.join
    return
  end
  letters = phones[digits[index]]
  letters.each_char do |c|
    path << c
    dfs(digits, phones, results, index + 1, path)
    path.pop
  end
end

def letter_combination_iterative(digits)
  return [] if digits.empty?

  phones = {
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }
  results = ['']
  digits.each_char do |digit|
    letters = phones[digit]
    new_results = []

    results.each do |prefix|
      letters.each_char do |letter|
        new_results << (prefix + letter)
      end
    end
    results = new_results
  end
  results
end

# Ví dụ
p letter_combinations('23')

p letter_combination_iterative('23')
