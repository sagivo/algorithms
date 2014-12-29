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

def lis_dp arr
  dp = [1] * arr.length
  pi = [-1] * arr.length
  last_index = 0
  arr.each_with_index{|v,i|
    i.times{|j|
      if arr[j] < arr[i] and dp[i] < dp[j] + 1
        dp[i] = dp[j] + 1
        pi[i] = j
      end
      last_index = i if dp[last_index] < dp[i]
    }
  }
  lis_seq = []
  while last_index >= 0
    lis_seq.push(arr[last_index])
    last_index = pi[last_index]
  end
  lis_seq.reverse
end

#test
p lis_dp [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11,4,5,6, 7, 15,8,9] #[0, 4, 6, 9, 13, 15]