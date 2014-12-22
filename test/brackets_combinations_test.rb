require "test_helper"
require "brackets_combinations"

class BracketsCombinationsTest < Test::Unit::TestCase

  def test_algorithm
    assert_equal ["((()))","(()())","(())()","()(())","()()()"], BracketsCombinations.perform('', 0, 0, 3)
  end

end
