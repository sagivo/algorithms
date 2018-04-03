# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  left = Array.new(nums.size)
  right = Array.new(nums.size)
  ans = Array.new(nums.size)

  (0...nums.size).each do |i|
    if i == 0
      left[i] = nums[i]
    else
      left[i] = nums[i] * left[i - 1]
    end
  end

  (nums.size - 1).downto(0).each do |i|
    if i == nums.size - 1
      right[i] = nums[i]
    else
      right[i] = nums[i] * right[i + 1]
    end
  end

  (0...nums.size).each do |i|
    l = i == 0 ? 1 : left[i - 1]
    r = i == nums.size - 1 ? 1 : right[i + 1]
    ans[i] = l * r
  end
  ans
end

p product_except_self([1,2])