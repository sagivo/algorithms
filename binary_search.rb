class BinarySearch
  def search(arr, key)
    min = 0; max = arr.size - 1
    while min <= max
      mid = min + (max-min)/2
      if key < arr[mid]
        max = mid - 1
      elsif key > arr[mid]
        min = mid + 1
      else
        return mid
      end
    end
    return -1
  end
end

require 'test/unit'

class BinarySearchTest < Test::Unit::TestCase
  def test_algorithm
    ar = [23, 45, 67, 89, 123, 568]
    binary = BinarySearch.new
    assert_equal 0, binary.search(ar, 23)
    assert_equal 4, binary.search(ar, 123)
    assert_equal -1, binary.search(ar, 120)
  end
end
