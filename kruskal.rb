#!/usr/bin/env ruby

# DisjointSet - Union-Find Data Structure
#   - root(x): find the leader of the set where x in
#   - connected?(x, y): check if x and y are in the same set
#   - union(x, y): union x and y if x and y which are not in the same set
class DisjointSet
  def initialize(n)
    @parent = Array.new(n, -1)
  end

  def root(x)
    @parent[x] < 0 ? x : @parent[x] = root(@parent[x])
  end

  def connected?(x, y)
    root(x) == root(y)
  end

  def union(x, y)
    if connected?(x, y)
      false
    else
      rx = root(x)
      ry = root(y)
      rx, ry = ry, rx if @parent[rx] > @parent[ry]
      @parent[rx] += @parent[ry]
      @parent[ry] = rx
    end
  end
end

Edge = Struct.new(:from, :to, :weight) do
  def <=> rhs
    self.weight <=> rhs.weight
  end
end

# minimum spanning tree
# the label of the vertex is between 0 and n - 1
def kruskal(n, edges)
  ret = []
  dsu = DisjointSet.new(n)
  edges.sort.each{ |e| ret << e if dsu.union(e.from, e.to) }
  ret
end

# test
edges = [
  Edge.new(0, 1, 1), Edge.new(1, 2, 2), Edge.new(2, 3, 9),
  Edge.new(3, 0, 7), Edge.new(0, 2, 2), Edge.new(1, 3, 6)
]

p kruskal(4, edges) # (0, 1, 1) (1, 2, 2) (1, 3, 6)
