#https://en.wikipedia.org/wiki/Newton%27s_method
def sqr_root x, accuracy = 0.0001, round = 3
  return 'error' if x < 0
  a,b = 1.to_f,x.to_f
  
  #by abs I mean whatever the absolute value function is on ruby.  I'm not very familiar with this language
  while abs(b-a) > accuracy
    b = (a+b) / 2
    a = x/b
  end
  b.round round
end

p sqr_root 100 #10.0
p sqr_root 12 #3.464
p sqr_root .5 #0.707 
