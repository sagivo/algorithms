# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
    return 0 if coins.empty? or amount <= 0
    max = 4000000000
    res = Array.new(amount, 0)

    (1..amount).each do |am|
        res[am] = max

        coins.each do |c|
            next if c > am
            res[am] = [res[am], 1 + res[am - c]].min
        end
    end

    res[amount] == max ? -1 : res[amount]
end

p coin_change([1, 2, 5], 11) # => 3
