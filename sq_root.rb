#https://en.wikipedia.org/wiki/Newton%27s_method
def sqr_root x, accuracy = 0.0001
  return 'error' if x < 0
  a,b = 1,x
  while b-a > accuracy
    b = (a+b) / 2
    a = x/b
  end
  b
end

p sqr_root 100 #10
p sqr_root 12 #3