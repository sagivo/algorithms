require "test_helper"
require "bigger_num_with_same_digits"

class BiggerNumWithSameDigitsTest < Test::Unit::TestCase

  def test_algorithm
    assert_equal 38627, BiggerNumWithSameDigits.perform(38276)
  end

end
