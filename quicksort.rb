class Quicksort

  def self.perform(arr, lo = 0, hi = nil)
    hi ||= arr.size - 1
    return arr if hi <= lo
    pivot = partition arr, lo, hi
    perform arr, lo, pivot-1
    perform arr, pivot+1, hi
  end

  private

  def self.partition(arr, lo, hi)
    i,j = lo+1,hi
    while true
      i+=1 while arr[i] <= arr[lo] and i < hi
      j-=1 while arr[j] > arr[lo] and j > lo
      break if i>=j
      arr[i], arr[j] = arr[j], arr[i] #swap
    end
    arr[lo], arr[j] = arr[j], arr[lo]
    j
  end
end

require 'test/unit'

class QuicksortTest < Test::Unit::TestCase
  def test_algorithm
    assert_equal [1, 2, 3, 4, 6, 6, 9, 14, 33, 56], Quicksort.perform([3,4,2,6,56,14,33,1,9,6])
  end
end
