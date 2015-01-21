# range minimum query, sparse table algorithm. O(nlogn) preprocess time
class RMQ
  def initialize(arr)
    n = arr.size
    @rmq = [arr]
    1.upto(n) do |j|
      break if 2**j > n
      cur = Array.new(n)
      0.upto(n-2**j){ |i| cur[i] = [@rmq[j-1][i], @rmq[j-1][i+2**(j-1)]].min }
      @rmq << cur
    end
  end

  def query(l, r)
    d = 0
    d += 1 while 2**(d+1) < r - l + 2
    [@rmq[d][l], @rmq[d][r+1-2**d]].min
  end
end

# test
10.times do
  n = rand(1000)
  arr = [*0..n].shuffle
  rmq = RMQ.new(arr)

  100.times do
    l, r = [rand(n), rand(n)].sort
    min = arr[l..r].min
    cur_min = rmq.query(l, r)
    if min != cur_min
      p "error!"
      p arr.join(' ')
      p "query on range [#{l}, #{r}], minimum should be #{min}, found #{cur_min}!"
      exit 1
    end
  end
end

p "ok"
