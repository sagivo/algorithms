def brackets output, open, close, pairs
  if open == pairs and close == pairs
    p output
  else
    brackets output+'(', open+1, close, pairs if open<pairs      
    brackets output+')', open, close+1, pairs if close<open      
  end
end

brackets('', 0, 0, 3)
