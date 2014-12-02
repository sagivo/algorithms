#prints all combinations of join sets
def join_sets set, i, str = ''
  return p str if str.size == set.size
  for item in set[i]    
    join_sets set, i.succ, str + item.to_s
  end
end

join_sets [ ['A','B'] , ['C','D'], ['E'] ], 0

=begin
  
"ACE"
"ADE"
"BCE"
"BDE"
  
=end
