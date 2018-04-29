def towers(list)
  while !list.empty?
    n, src, dst, aux = list.pop
    if n == 1
      puts "Move disk from #{src} to #{dst}"
    else
      list.push [n-1, aux, dst, src]
      list.push [1, src, dst, aux]
      list.push [n-1, src, aux, dst]
    end
  end
end

list = []
list.push([3, "a", "c", "b"])
towers(list)
