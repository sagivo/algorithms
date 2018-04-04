# @param {Integer[]} a
# @param {Integer[]} b
# @param {Integer[]} c
# @param {Integer[]} d
# @return {Integer}

def four_sum_count(a, b, c, d)
  return check_4_sum(a, b, c, d)
end

def create_set(a, b)
  h = {}
  for ai in a
    for bi in b
      h[ai + bi] ||= 0
      h[ai + bi] += 1
    end
  end
  return h
end

def check_4_sum(a, b, c, d)
  tot = 0
  a1 = create_set(a, b)
  a2 = create_set(c, d)
  a1.each do |k, v|
    if a2[-1 * k]
      tot += v * a2[-1 * k]
    end
  end
  p a1, a2
  return tot
end

p four_sum_count([-1,-1], [-1,1], [-1, 1], [1,-1])