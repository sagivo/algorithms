# @param {String} s
# @return {String}
def decode_string(s)
  strings = ['']
  dups = []
  str = ''
  i = 0
  while i < s.size do
    if (s[i].to_i > 0)
      j = i+1
      j += 1 while s[j] != '['
      num = s[i...j].to_i
      dups.push(num)
      strings.push(str)
      i = j+1
    elsif s[i] == ']'
      num = dups.pop
      str = strings.pop
      str *= num
      prev = strings.pop
      strings.push(prev + str)
      str = ''
      i+=1
    elsif s[i] != '['
      str = strings.pop || ''
      str += s[i]
      strings.push(str)
      str = ''
      i+=1
    end
  end

  return strings.pop
end

p decode_string('2[abc]3[cd]ef') # => abcabccdcdcdef
