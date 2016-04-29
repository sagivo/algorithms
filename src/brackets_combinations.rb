def brackets(pairs, output='', open=0, close=0, arr = [])
  arr << output if open == pairs and close == pairs      
  brackets pairs, output+'(', open+1, close, arr if open<pairs
  brackets pairs, output+')', open, close+1, arr if close<open
  arr
end

#test
p brackets(3) #["((()))", "(()())", "(())()", "()(())", "()()()"]
