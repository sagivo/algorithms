#powerset - subset of set
def powerset(arr)
  result = [[]] 
  arr.each do |num|
    (0...arr.size).each do |j|
      result << result[j] + [num]
    end
  end 
  result
end

p powerset [1,2,3] #[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
