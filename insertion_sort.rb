# https://en.wikipedia.org/wiki/Insertion_sort
def insertion_sort a
  for i in 1..(a.size - 1)
    x = a[i]
    j = i
    while(j > 0 && a[j-1] >= x)
      a[j] = a[j-1]
      j -= 1
    end
    a[j] = x
  end
  a
end

#test
p insertion_sort [4,2,3,3,1,2,2,10,1,0]
