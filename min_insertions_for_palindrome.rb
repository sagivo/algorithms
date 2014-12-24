#from http://www.geeksforgeeks.org/dynamic-programming-set-28-minimum-insertions-to-form-a-palindrome/
def min_for_palindrome str, left=0, right=nil
  right ||= str.size-1
  return Float::INFINITY if left > right
  return 0 if left == right or (left == right-1 and str[left] == str[right])
  return 1 if left == right-1
  if str[left] == str[right] then min_for_palindrome(str, left+1, right-1) else [min_for_palindrome(str,left+1, right), min_for_palindrome(str,left,right-1)].min + 1 end
end

#test
p min_for_palindrome 'geek' #2 -> kgeegk
