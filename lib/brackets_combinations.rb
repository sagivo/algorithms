class BracketsCombinations
  def self.perform(output, open, close, pairs)
    if open == pairs and close == pairs
      p output
    else
      perform output+'(', open+1, close, pairs if open<pairs
      perform output+')', open, close+1, pairs if close<open
    end
  end
end
