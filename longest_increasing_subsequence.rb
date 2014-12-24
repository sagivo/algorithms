def lis arr
  a = Array.new(arr.size) { |i| i = [arr[i]] }  
  (1..arr.size-1).each do |i|
    (0..i).each do |j|
      if a[i].size <= a[j].size and a[i].last > a[j].last
        a[i] = a[j] + [arr[i]]
      end
    end
  end
  p a.last
end

#test
lis [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15] #[0, 4, 6, 9, 13, 15]