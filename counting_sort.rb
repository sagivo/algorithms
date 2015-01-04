#all numbers need to be positive
def counting_sort(arr)
  max = arr.max
  c = Array.new(max+2, 0) # initialize counting array with k+1 zero values    
  arr.each { |i| c[i] += 1 } # build a histogram / count occurrences of all integer values in array a  
  (0..max).each { |i| c[i] += c[i-1] } # compute indices for each key  
  b = Array.new(arr.size, 0) # initialize output array
  arr.each { |i| b[c[i]-1] = i;  c[i] -= 1 }
  b
end

#test
p counting_sort [7,20,12,3,2,2,2,1,1,0,0] # => [0, 0, 1, 1, 2, 2, 2, 3, 7, 12, 20]