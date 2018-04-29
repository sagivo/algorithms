class Node
  attr_accessor :name, :idx, :lowlink, :on_stack

  def initialize(name)
    @name = name
  end

  def ==(other)
    if other.class == Node
      other.name == self.name
    elsif other.class == String
      other == self.name
    else
      false
    end
  end

  def to_s
    @name
  end
end

class Edge
  attr_accessor :from, :to

  def initialize(node_from, node_to)
    @from, @to = node_from, node_to
  end

  def ==(other)
    self.from == other.from && self.to == other.to
  end

  def to_s
    "(#{from.to_s} -> #{to.to_s})"
  end
end

class Graph
  attr_accessor :nodes, :edges, :adjmt

  def initialize(load_dict = {})
    @nodes = []
    @edges = []
    @adjmt = {}

    if load_dict.size > 0 && load_dict.class == Hash
      load_dict.each do |v, edges|
        node_from = self.add_node(v)
        adjmt[node_from] = []
        edges.each do |w|
          node_to = self.add_node(w)
          adjmt[node_from] << node_to
          self.add_edge(v, w)
        end
      end
    end
  end

  def add_node(node_name)
    if nodes.index(node_name)
      return nodes[nodes.index(node_name)]
    else
      node = Node.new(node_name)
      nodes << node
      return node
    end
  end

  def add_edge(node_name_from, node_name_to)
    node_from = nodes[nodes.index(node_name_from)]
    node_to = nodes[nodes.index(node_name_to)]
    edges << Edge.new(node_from, node_to)
  end
end

class Tarjan
  attr_accessor :graph, :idx, :stack, :sccs

  def initialize(graph)
    if graph.class == Graph
      @graph = graph
    elsif graph.class == Hash
      @graph = Graph.new(graph)
    end

    if graph != nil
      @idx = 0
      @stack = []

      # Runs Tarjan
      # Set all node index to None
      self.graph.nodes.each do |v|
        v.idx = nil
      end

      @sccs = []
      self.graph.nodes.each do |v|
        if v.idx == nil
          self.strongconnect(v, sccs)
        end
      end
    end
  end

  def strongconnect(v, sccs)
    # Set the depth index for v to the smallest unused index
    v.idx = self.idx
    v.lowlink = self.idx
    self.idx += 1
    stack << v
    v.on_stack = true

    if graph.adjmt[v] != nil
      # Consider successors of v
      graph.adjmt[v].each do |w|
        if w.idx == nil
          # Successor w has not yet been visited; recurse on it
          self.strongconnect(w, sccs)
          v.lowlink = [v.lowlink, w.lowlink].min
        elsif w.on_stack
          # Successor w is in stack S and hence in the current SCC
          # If w is not on stack, then (v, w) is a cross-edge in the DFS tree and must be ignored
          # Note: The next line may look odd - but is correct.
          # It says w.index not w.lowlink; that is deliberate and from the original paper
          v.lowlink = [v.lowlink, w.idx].min
        end
      end
    end
    
    # If v is a root node, pop the stack and generate an SCC
    if v.lowlink == v.idx
      # start a new strongly connected component
      scc = []
      while true
        w = stack.pop()
        w.on_stack = false
        scc << w
        if w == v
          break
        end
      end
      sccs << scc
    end
  end
end

# Graph from https://en.wikipedia.org/wiki/File:Scc.png
example = {
  'A' => ['B'],
  'B' => ['C', 'E', 'F'],
  'C' => ['D', 'G'],
  'D' => ['C', 'H'],
  'E' => ['A', 'F'],
  'F' => ['G'],
  'G' => ['F'],
  'H' => ['D', 'G']
}

g = Tarjan.new(example)
print g.sccs.map{|scc| scc.map{|v| v.to_s}}.to_s + "\n"

# Graph from https://en.wikipedia.org/wiki/Tarjan%27s_strongly_connected_components_algorithm#/media/File:Tarjan%27s_Algorithm_Animation.gif
example = {
  'A' => ['E'],
  'B' => ['A'],
  'C' => ['B', 'D'],
  'D' => ['C'],
  'E' => ['B'],
  'F' => ['B', 'E', 'G'],
  'G' => ['F', 'C'],
  'H' => ['G', 'H', 'D']
}
g = Tarjan.new(example)
print g.sccs.map{|scc| scc.map{|v| v.to_s}}.to_s + "\n"
