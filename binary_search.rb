#nlogn
def bsearch(arr, key)
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

#test
ar = [23, 45, 67, 89, 123, 568]
p bsearch(ar, 23) #0
p bsearch(ar, 123) #4
p bsearch(ar, 120) #-1
