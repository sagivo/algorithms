# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    max = -2147483648; t = 0;
    nums.each do |n|
        t = [t+n, n].max
        max = [max, t].max
    end
    max
end
