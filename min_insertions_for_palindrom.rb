#from http://www.geeksforgeeks.org/dynamic-programming-set-28-minimum-insertions-to-form-a-palindrome/
def min_insert str, left=0, right=nil
  right ||= str.size-1
  return Float::INFINITY if left > right
  return 0 if left == right or left == right-1
  if str[left] == str[right] then min_insert(str, left+1, right-1) else [min_insert(str,left+1, right), min_insert(str,left,right-1)].min + 1 end
end

p min_insert 'geeks'
#return