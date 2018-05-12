# problem: https://leetcode.com/problems/add-binary
# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    i = 0
    cerry = 0
    res = ''

    while (i < a.size) || (i < b.size) do
        a1 = i<a.size ? a[a.size-1 - i].to_i : 0
        b1 = i<b.size ? b[b.size-1 - i].to_i : 0
        num = a1 ^ b1 ^ cerry
        res += num.to_s
        cerry = (a1 + b1 + cerry) >= 2 ? 1 : 0
        i+=1
    end
    res += '1' if cerry == 1

    return res.reverse
end

p add_binary('1010','1011') #=> '10101'