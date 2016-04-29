#prints all combinations of join sets 
def join_sets set, i = 0, str = '', result = []
  return result << str if str.size == set.size
  for item in set[i]    
    join_sets set, i.succ, str + item.to_s, result
  end
  result
end

p join_sets [ ['A','B'] , ['C','D'], ['E'] ] #["ACE", "ADE", "BCE", "BDE"]
