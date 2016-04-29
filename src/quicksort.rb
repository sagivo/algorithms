def partition arr, lo, hi  
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

def quicksort arr, lo = 0, hi = nil  
  hi ||= arr.size - 1
  return arr if hi <= lo
  pivot = partition arr, lo, hi
  quicksort arr, lo, pivot-1
  quicksort arr, pivot+1, hi
end

#test
p quicksort [3,4,2,6,56,14,33,1,9,6] #[1, 2, 3, 4, 6, 6, 9, 14, 33, 56]