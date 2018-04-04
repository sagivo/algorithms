# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  buckets = Array.new(nums.size)
  h = {}
  #store counts
  nums.each do |n|
    h[n] = h[n] ? h[n] + 1 : 1
  end
  #move cunts to buckets
  h.each do |number, count|
    buckets[count] = [] unless buckets[count]
    buckets[count] << number
  end
  #get top k elements
  ans = []
  (buckets.size - 1).downto(0).each do |i|
    if buckets[i]
      buckets[i].each do |n|
        ans << n if ans.size < k
      end
    end
  end

  return ans
end

p top_k_frequent([1,2], 2)