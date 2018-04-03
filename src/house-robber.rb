# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.empty?
  return foo(nums, 0)
end

def foo(nums, i, h = {})
  return h[i] if h[i]
  return nums[i] if (i == nums.size - 1)
  return 0 if (i >= nums.size)
  h[i] = [nums[i] + foo(nums, i+2, h), foo(nums, i+1, h)].max
  return h[i]
end


p rob([15,10,3, 10]) # => 25