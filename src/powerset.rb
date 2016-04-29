#powerset - subset of set
def powerset arr
  a = [[]] 
  for num in arr
    size_a = a.size; j = 0;
    while j < size_a
      a << (a[j] + [num])
      j+=1
    end
  end 
  a 
end

p powerset [1,2,3] #[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]