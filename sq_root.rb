#https://en.wikipedia.org/wiki/Newton%27s_method
def sqr_root x, accuracy = 0.0001, round = 3
  return 'error' if x < 0
  a,b = 1.to_f,x.to_f
  while (b-a).abs > accuracy
    b = (a+b) / 2
    a = x/b
  end
  b.round round
end

#test
p sqr_root 0.4 #0.632
p sqr_root 100 #10
p sqr_root 12 #3.464