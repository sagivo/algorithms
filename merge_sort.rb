def merge_sort(lst)
  return lst if lst.length <= 1
  mid = lst.length / 2
  left = merge_sort(lst[0..mid - 1])
  right = merge_sort(lst[mid..lst.length])
  merge(left, right)
end

def merge(left, right)  
  result = []; i = j = 0;
  while i < left.size and j < right.size
    if left[i] <= right[j]
      result << left[i]; i+=1;
    else
      result << right[j]; j+=1;
    end
  end
  while i<left.size do 
    result << left[i]; i+=1;
  end
  while j<right.size
    result << right[j]; j+=1;
  end
  result
end

#test
p merge_sort [4,3,6,1,2,7,8,5,9,0] #[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]