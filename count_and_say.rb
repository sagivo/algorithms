# @param {Integer} n
# @return {String}
def count_and_say(n)
    return "1" unless n > 1
    a = "1"; 
    (n-1).times do
        t = '';  last = nil; count = 0
        a.chars.each_with_index do |c,i|
            if c == last or last.nil?
                count+=1
            else
                t+= (count.to_s + last); 
                count = 1 
            end
            last = c
        end
        t += (count.to_s + last) if count > 0 
        a=t
    end
    return a
end
