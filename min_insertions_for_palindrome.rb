#from http://www.geeksforgeeks.org/dynamic-programming-set-28-minimum-insertions-to-form-a-palindrome/
class MinForPalindrome
  def self.perform str, left=0, right=nil
    right ||= str.size-1
    return Float::INFINITY if left > right
    return 0 if left == right or left == right-1
    if str[left] == str[right] then perform(str, left+1, right-1) else [perform(str,left+1, right), perform(str,left,right-1)].min + 1 end
  end
end

require 'test/unit'

class MinForPalindromeTest < Test::Unit::TestCase
  def test_algorithm
    assert_equal 3, MinForPalindrome.perform('geeks')
  end
end
