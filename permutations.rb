def perm arr, i=0, result = []
  result << arr if i == arr.size
  (i..arr.size-1).each do |j|
    arr[i], arr[j] = arr[j], arr[i]
    perm arr, i+1, result
    arr[i], arr[j] = arr[j], arr[i]
  end
  result
end

#test
p perm 'ABC' #["ABC", "ABC", "ABC", "ABC", "ABC", "ABC"]