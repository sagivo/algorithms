
# Sorts a list of integers.
# @param a [List] list of integers
# @param k [Integer] a number such that all integers in list 'a' are in the range 0..k-1
# @return [List] the sorted list
#
# ==== Examples
# counting_sort([20,12,3,2,2,2,1,1,0,0],21) => [0, 0, 1, 1, 2, 2, 2, 3, 12, 20]
#
def counting_sort(a, k)
  c = Array.new(k+1, 0) # initialize counting array with k+1 zero values

  # build a histogram / count occurrences of all integer values in array a
  a.each do |integer|
    c[integer] += 1
  end

  # compute indices for each key
  (0..k).each do |i|
    c[i] += c[i-1]
  end

  b = Array.new(a.length, 0) # initialize output array
  a.each do |integer|
    b[c[integer]-1] = integer
    c[integer] -= 1
  end
  b
end

p counting_sort [7,20,12,3,2,2,2,1,1,0,0], 21 # => [0, 0, 1, 1, 2, 2, 2, 3, 7, 12, 20]

p counting_sort [0], 1 # => [0]

p counting_sort [], 0 # => []