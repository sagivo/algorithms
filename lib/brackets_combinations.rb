class BracketsCombinations
  def self.perform(output, open, close, pairs)
    p output if open == pairs and close == pairs      
    perform output+'(', open+1, close, pairs if open<pairs
    perform output+')', open, close+1, pairs if close<open
  end
end


