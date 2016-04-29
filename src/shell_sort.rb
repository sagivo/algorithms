def shell_sort a
  n = a.size
  gap = 1
  gap = gap * 3 + 1 while gap < n / 3
  while gap > 0
    gap.upto(n-1) do |i|
      j = i
      ai = a[i]
      while j >= gap && ai < a[j-gap]
        a[j] = a[j-gap]
        j -= gap
      end
      a[j] = ai
    end
    gap /= 3
  end
  a
end

p shell_sort [*1..20].shuffle
