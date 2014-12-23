#prints all combinations of join sets
class JoinSets
  def self.perform(set, i, str = '')
    return str if str.size == set.size
    for item in set[i]
      perform set, i.succ, str + item.to_s
    end
  end
end

require 'test/unit'

class JoinSetsTest < Test::Unit::TestCase
  def test_algorithm
    assert_equal [["A", "B"]], JoinSets.perform([ ['A','B'] , ['C','D'], ['E'] ], 0)
  end
end
