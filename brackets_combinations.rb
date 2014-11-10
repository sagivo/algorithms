def brackets output, open, close, pairs
  if open == pairs and close == pairs
    p output
  else
    foo output+'(', open+1, close, pairs if open<pairs      
    foo output+')', open, close+1, pairs if close<open      
  end
end

brackets('', 0, 0, 3)