#!/usr/bin/env ruby

def gcd_rec(x, y)
  y == 0 ? x : gcd_rec(y, x%y)
end

def gcd_iter(x, y)
  x, y = y, x%y while y != 0
  x
end

# ax + by = gcd(x, y)
def xgcd_rec(x, y)
  if y == 0
    [x, 1, 0]
  else
    gcd, a, b = xgcd_rec(y, x%y)
    [gcd, b, a-x/y*b]
  end
end

# ax + by = gcd(x, y)
def xgcd_iter(x, y)
  a, next_a = 1, 0
  b, next_b = 0, 1
  while y != 0
    a, next_a = next_a, a-x/y*next_a
    b, next_b = next_b, b-x/y*next_b
    x, y  = y, x%y
  end
  [x, a, b]
end

# test
10.times do
  x = Random.rand(100) + 1
  y = Random.rand(100) + 1
  gcd_res = x.gcd(y)
  gcd_rec_res = gcd_rec(x, y)
  gcd_iter_res = gcd_iter(x, y)
  g1, a1, b1 = xgcd_rec(x, y)
  g2, a2, b2 = xgcd_iter(x, y)
  puts "#{gcd_res}\t#{gcd_rec_res}\t#{gcd_iter_res}\t#{a1}*#{x}+#{b1}*#{y}=#{g1}\t#{a2}*#{x}+#{b2}*#{y}=#{g2}"
end
