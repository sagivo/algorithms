def letters_for_number num 
  case num
    when 0, 1
      [num]
    when 2 
      ['A', 'B', 'C'] 
    when 3 
      ['D', 'E', 'F']
    when 4 
      ['G', 'H', 'I']
    when 5 
      ['J', 'K', 'L']
    when 6 
      ['M', 'N', 'O']
    when 7 
      ['P', 'R', 'S']
    when 8 
      ['T', 'U', 'V']
    when 9 
      ['W' ,'X', 'Y']
    else
      []
  end  
end

def join_sets set, i = 0, str = ''  
  return p str if str.size == set.size
  for item in set[i]    
    join_sets set, i.succ, str + item.to_s
  end
end

def phone_options number
  set = number.to_s.split('').map {|digit| letters_for_number digit.to_i}
  join_sets set
end

phone_options '10-34'
=begin
  
"100DG"
"100DH"
"100DI"
"100EG"
"100EH"
"100EI"
"100FG"
"100FH"
"100FI"
  
=end
