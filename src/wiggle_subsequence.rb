# @param {Integer[]} nums
# @return {Integer}
def wiggle_max_length(nums)
  return nums.size if nums.size < 2
  up = nil
  i = 1; res = 0
  while i < nums.size
    while i < nums.size and (
      (up == nil and nums[i] == nums[i-1]) or
      (up == true && nums[i] >= nums[i-1]) or
      (up == false && nums[i] <= nums[i-1]))
      i += 1
    end
    up = (up == nil and i < nums.size) ? nums[i] > nums[i-1] : !up
    res += 1
  end

  return res
end

p wiggle_max_length([1,17,5,10,13,15,10,5,16,8]) # => 7
