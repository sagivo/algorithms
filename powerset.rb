#powerset - subset of set
def powerset arr
  a = [[]] 
  for i in 0...arr.size do
    len = a.size; j = 0;
    while j < len
      a << (a[j] + [arr[i]])
      j+=1
    end
  end 
  p a 
end

powerset [1,2,3]