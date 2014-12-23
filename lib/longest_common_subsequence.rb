#Longest common subsequence problem 
#https://en.wikipedia.org/wiki/Longest_common_subsequence_problem
def LCSLength (x, y)
    h = Array.new(x.size) {Array.new(y.size)}
    x.size.times {|i| h[i][0] = x[0] == y[0] ? 1 : 0 }
    y.size.times {|i| h[0][i] = x[0] == y[0] ? 1 : 0 }

    (1..x.size-1).each do |i|
        (1..y.size-1).each do |j|
            if x[i] == y[j]
                h[i][j] = (h[i-1][j-1] ? h[i-1][j-1] : 0) + 1
            else
                h[i][j] = [ h[i-1][j] ? h[i-1][j] : 0, h[i][j-1] ? h[i][j-1] : 0].max
            end
        end
    end
    h[x.size-1][y.size-1]
end


p LCSLength('waaaa', 'bbbbasfaaewra') #returns 4