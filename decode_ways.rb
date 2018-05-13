# problem: https://leetcode.com/problems/decode-ways/description/
# @param {String} s
# @return {Integer}
def num_decodings(s)
    return 0 if s.empty? or s.start_with? '0'
    close = far = 1

    (2..s.size).each do |i|
        cur = 0
        cur = close if s[i-1] != '0'
        cur += far if s[i-2] == '1' or (s[i-2] == '2' and s[i-1].to_i <= 6)
        far = close
        close = cur
    end
    return close
end