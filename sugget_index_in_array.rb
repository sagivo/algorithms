=begin
Given an unsorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
You may assume no duplicates in the array.
Here are few examples.
[1,3,5,6], 5 → 2
[1,5,3,6], 2 → 1
[1,3,5,6], 7 → 4
[3,1,6,5], 0 → 0
=end

def search_insert(nums, target)
    return 0 if !nums or nums.empty?
    lo = 0; hi = nums.size-1
    while hi > lo
        k = quicksort(nums,lo,hi,target)
        if target == nums[k]
            return k
        elsif target > nums[k]
            lo=k+1;
        else # target < nums[k]
            hi=k-1
        end
    end
    k
end

def quicksort(arr, lo, hi, k)
    i = lo+1; j = hi;
    while true
      i+=1 while arr[i] <= arr[lo] and i < hi
      j-=1 while arr[j] > arr[lo] and j > lo
      break if i >= j
      arr[i], arr[j] = arr[j], arr[i]
    end
    arr[lo], arr[j] = arr[j], arr[lo]
    j
end
