class LIS
  def self.perform(arr)
    a = Array.new(arr.size) { |i| i = [arr[i]] }
    (1..arr.size-1).each do |i|
      (0..i).each do |j|
        if a[i].size <= a[j].size and a[i].last > a[j].last
          a[i] = a[j] + [arr[i]]
        end
      end
    end
    p a.last
  end
end

require 'test/unit'

class LISTest < Test::Unit::TestCase
  def test_algorithm
    assert_equal [0, 4, 6, 9, 13, 15], LIS.perform([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15])
  end
end
