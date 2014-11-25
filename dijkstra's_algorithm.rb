class Graph
  Vertex = Struct.new(:name, :neighbours, :dist, :prev)
 
  def initialize(graph)
    @vertices = Hash.new{|h,k| h[k]=Vertex.new(k,[],Float::INFINITY)}
    @edges = {}
    graph.each do |(v1, v2, dist)|
      @vertices[v1].neighbours << v2
      @vertices[v2].neighbours << v1
      @edges[[v1, v2]] = @edges[[v2, v1]] = dist
    end
    @dijkstra_source = nil
  end
 
  def dijkstra(source)
    return  if @dijkstra_source == source
    q = @vertices.values
    q.each do |v|
      v.dist = Float::INFINITY
      v.prev = nil
    end
    @vertices[source].dist = 0
    until q.empty?
      u = q.min_by {|vertex| vertex.dist}
      break if u.dist == Float::INFINITY
      q.delete(u)
      u.neighbours.each do |v|
        vv = @vertices[v]
        if q.include?(vv)
          alt = u.dist + @edges[[u.name, v]]
          if alt < vv.dist
            vv.dist = alt
            vv.prev = u.name
          end
        end
      end
    end
    @dijkstra_source = source
  end
 
  def shortest_path(source, target)
    dijkstra(source)
    path = []
    u = target
    while u
      path.unshift(u)
      u = @vertices[u].prev
    end
    return path, @vertices[target].dist
  end
 
  def to_s
    "#<%s vertices=%p edges=%p>" % [self.class.name, @vertices.values, @edges] 
  end
end
 
g = Graph.new([ [:a, :b, 7],
                [:a, :c, 9],
                [:a, :f, 14],
                [:b, :c, 10],
                [:b, :d, 15],
                [:c, :d, 11],
                [:c, :f, 2],
                [:d, :e, 6],
                [:e, :f, 9],
              ])
 
start, stop = :a, :e
path, dist = g.shortest_path(start, stop)
puts "shortest path from #{start} to #{stop} has cost #{dist}:"
puts path.join(" -> ")