#n^2
def lis arr
  a = Array.new(arr.size) { |i| i = [arr[i]] }  
  (1..arr.size-1).each do |i|
    (0..i).each do |j|
      if a[i].size <= a[j].size and a[i].last > a[j].last
        a[i] = a[j] + [arr[i]]
      end
    end
  end
  a.last
end

#test
p lis [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11,4,5,6, 7, 15,8,9] #[0, 2, 3, 4, 5, 6, 7, 8, 9]