# #from http://www.geeksforgeeks.org/dynamic-programming-set-28-minimum-insertions-to-form-a-palindrome/
def shortest_palindrome(s)
  helper(s, 0, s.size-1)
end

def helper(s, i, j)
  return 0 if i >= j
  if s[i] == s[j]
    return helper(s, i+1, j-1)
  else
    return 1 + [helper(s, i+1, j), helper(s, i, j-1)].min
  end
end

p shortest_palindrome('geek') # => 2 (kgeegk)