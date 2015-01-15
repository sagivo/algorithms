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

#test
p balanced_parentheses? '( () ( () ) () )' # => true
