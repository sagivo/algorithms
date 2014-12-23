class BracketsCombinations
  def self.perform(output, open, close, pairs)
    output if open == pairs and close == pairs
    perform output+'(', open+1, close, pairs if open<pairs
    perform output+')', open, close+1, pairs if close<open
  end
end

require "test/unit"

class BracketsCombinationsTest < Test::Unit::TestCase
  def test_algorithm
    assert_equal ["((()))","(()())","(())()","()(())","()()()"], BracketsCombinations.perform('', 0, 0, 3)
  end
end


