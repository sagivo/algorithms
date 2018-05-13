# problem: https://leetcode.com/problems/move-zeroes
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    i = 0
    nums.each do |n|
        if n != 0
            nums[i] = n
            i += 1
        end
    end
    (i...nums.size).each {|indx| nums[indx] = 0}
    return nums
end

p move_zeroes([0,1,0,3,12]) #=> [1,3,12,0,0]