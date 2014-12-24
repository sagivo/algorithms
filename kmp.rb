#Knuth–Morris–Pratt algorithm (KMP) algorithm, http://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm
#find the ptrn (m) in a string (m) in o(n+m) time and o(m) space. 

def kmp str, ptrn
  m = i = 0
  t = compute_table ptrn
  results = []

  while m + i < str.size
    if str[m+i] == ptrn[i] #match
      results << m if i == (ptrn.size - 1)
      i+=1
    else #fallback
      if t[i] and t[i] > -1
        m = m+1 - t[i]
        i = t[i]
      else
        i = 0
        m += 1
      end
    end
  end
  results
end

def compute_table ptrn
  arr = Array.new(ptrn.size)
  arr[0] = -1; arr[1] = 0;
  pos = 2; cnd = 0; 
  while pos < arr.size
    if ptrn[pos-1] == ptrn[cnd]
      cnd+=1; arr[pos] = cnd; pos+=1      
    elsif cnd > 0
      cnd = arr[cnd]
    else
      arr[pos] = 0; pos+=1
    end
  end
  arr
end

p kmp 'banana', 'na' #[2,4]