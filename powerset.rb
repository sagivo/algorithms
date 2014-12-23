#powerset - subset of set
class Powerset
  def self.perform(arr)
    a = [[]]
    for num in arr
      size_a = a.size; j = 0;
      while j < size_a
        a << (a[j] + [num])
        j+=1
      end
    end
    a
  end
end

require 'test/unit'

class PowersetTest < Test::Unit::TestCase
  def test_algorithm
    assert_equal [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]], Powerset.perform([1,2,3])
  end
end
