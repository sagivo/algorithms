#https://en.wikipedia.org/wiki/Newton%27s_method

class SqRoot
  def self.perform(x, accuracy = 0.0001, round = 3)
    return 'error' if x < 0
    a,b = 1.to_f,x.to_f
    while (b-a).abs > accuracy
      b = (a+b) / 2
      a = x/b
    end
    b.round round
  end
end

require 'test/unit'

class SqRootTest < Test::Unit::TestCase
  def test_algorithm
    assert_equal 0.632, SqRoot.perform(0.4)
    assert_equal 10, SqRoot.perform(100)
    assert_equal 3.464, SqRoot.perform(12)
  end
end
