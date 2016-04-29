#nlogn
def lis arr
  return [] if arr.empty?
  n = arr.size
  pre = [-1]
  len = [0]

  1.upto(n-1) do |i|
    # binary search first pos s.t. arr[len[pos]] >= arr[i]
    left, right, mid, pos = 0, len.size-1, -1, len.size
    while left <= right
      mid = left + (right - left) / 2
      if arr[len[mid]] >= arr[i]
        right = mid - 1
        pos = mid 
      else
        left = mid + 1
      end
    end
    if pos == len.size
      pre << len[pos-1]
      len << i
    else
      pre << (pos == 0 ? -1 : len[pos-1])
      len[pos] = i
    end
  end

  o = []
  i = len.last
  while i != -1
    o << arr[i]
    i = pre[i]
  end
  o.reverse
end

p lis [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 4, 5, 6, 7, 15, 8, 9]
# [0, 1, 3, 4, 5, 6, 7, 8, 9]
