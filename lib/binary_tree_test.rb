require "test_helper"
require "bigger_num_with_same_digits"

class BiggerNumWithSameDigitsTest < Test::Unit::TestCase
  def test_algorithm
    ar = [23, 45, 67, 89, 123, 568]
    binary = BinarySearch.new
    assert_equal binary.search(ar, 23), 0
    assert_equal binary.search(ar, 123), 4
    assert_equal binary.search(ar, 120), -1
  end
end