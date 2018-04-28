# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s, i = 0, dp = {})
  return dp["#{s}-#{i}"] if dp["#{s}-#{i}"]
  if i == nums.size
    return dp["#{s}-#{i}"] = s == 0 ? 1 : 0
  end

  return dp["#{s}-#{i}"] ||=
    find_target_sum_ways(nums, s + nums[i], i+1, dp) +
    find_target_sum_ways(nums, s - nums[i], i+1, dp)
end

p find_target_sum_ways([1, 1, 1, 1, 1], 3) # => 5