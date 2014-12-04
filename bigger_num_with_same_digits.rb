def smallest_bigger_number num  
  num = num.to_s.chars.map(&:to_i) #convert int to array of ints
  return num.join.to_i if num.size < 2
  for left in (num.size-2).downto(0) do
    for right in (num.size-1).downto(left+1) do
      if num[right]>num[left]
        num[left],num[right] = num[right],num[left]        
        return (num[0..left] + num[left+1..num.size-1].sort).join.to_i
      end
    end
  end
  return num.join.to_i
end

p smallest_bigger_number 38276 
#will print: 38627