#Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    return 0 unless prices.size > 1
    l, r, max_prof = 0, 1, 0
    while r < prices.size
        max_prof = [prices[r] - prices[l], max_prof].max
        l = r if prices[r] <= prices[l]
        r+=1
    end
    max_prof
end

p [10, 7, 5, 8, 11, 9] # => 6