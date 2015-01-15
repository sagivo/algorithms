def balanced_parentheses?(str)
  stack = []
  str.chars.each do |token|
    case token
      when '('
        stack.push '('
      when ')'
        if stack.empty? || stack.pop != '('
          return false
        end
    end
  end
  stack.empty?
end

# Tests
['', '(', ')', '()', '())', '( () ( () ) () )'].each do |test_case|
  result = balanced_parentheses?(test_case)
  puts "#{test_case.inspect} => #{result}"
end
