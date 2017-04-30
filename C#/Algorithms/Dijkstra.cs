using System.Collections.Generic;
using System.Linq;

namespace Algorithms.Dijkstra
{
    //Dijkstra's algorithm
    //https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm

    //C# ref: http://msdn.microsoft.com/en-us/library/ms379574(VS.80).aspx

    public class RoutInfo<T>
    {
        public T From { get; set; }
        public T To { get; set; }
        public int Distance { get; set; }

        public RoutInfo(T from, T to, int distance)
        {
            From = from; To = to; Distance = distance;
        }

        public override string ToString()
        {
            return string.Format("{0} - {1} ({2})", From, To, Distance);
        }

    }
    public class Graph<T>
    {
        public Graph()
        {
            Vertices = new List<Vertex<T>>();
        }

        Vertex<T> GetVertex(T value)
        {
            return Vertices.First(v => v.Value.Equals(value));
        }

        /// <summary>
        /// Graph Nodes
        /// </summary>
        public List<Vertex<T>> Vertices { get; set; }

        public void AddVertex(Vertex<T> vertex)
        {
            Vertices.Add(vertex);
        }

        public void AddVertex(T value)
        {
            Vertices.Add(new Vertex<T> { Value = value });
        }

        public void AddEdge(Vertex<T> from, Vertex<T> to, int cost)
        {
            GetVertex(from.Value).Vertices.Add(GetVertex(to.Value));
            GetVertex(from.Value).Cost.Add(cost);

            GetVertex(to.Value).Vertices.Add(GetVertex(from.Value));
            GetVertex(to.Value).Cost.Add(cost);
        }
    }

    public class Vertex<T>
    {
        private T _value;
        /// <summary>
        /// Node data / Vertex data / Node name / context
        /// </summary>
        public T Value
        {
            get { return _value; }
            set { _value = value; }
        }

        private List<int> _cost;
        /// <summary>
        /// Cost / Distance / Length associated with each node / Vertes
        /// </summary>
        public List<int> Cost
        {
            get { return _cost; }
            set { _cost = value; }
        }

        public Vertex()
        {
            Vertices = new List<Vertex<T>>();
            Cost = new List<int>();
        }

        /// <summary>
        /// Neighbors / Adjacent nodes
        /// </summary>
        public List<Vertex<T>> Vertices { get; set; }

        public override string ToString()
        {
            return _value.ToString();
        }
    }

    public class Dijkstra<T>
    {
        private Dictionary<T, int> _distances;
        private Dictionary<T, T> _routes;
        private Graph<T> _graph;
        private T _source;

        public Dijkstra(Graph<T> graph, T source)
        {
            _distances = new Dictionary<T, int>();
            _routes = new Dictionary<T, T>();

            _graph = graph;
            _source = source;

            Initializations();

            var Q = _graph.Vertices;

            while (Q.Count > 0)
            {
                var u = GetMinNode(Q);
                Q.Remove(u);

                for (int i = 0; i < u.Vertices.Count; i++)
                {
                    RelaxEdge(u.Value, u.Vertices[i].Value, u.Cost[i]);
                }
            }
        }

        private void Initializations()
        {
            _distances[_source] = 0;
            foreach (var v in _graph.Vertices)
            {
                if (!v.Value.Equals(_source))
                {
                    _distances.Add(v.Value, int.MaxValue);
                    _routes.Add(v.Value, default(T));
                }
            }
        }

        private void RelaxEdge(T u, T v, int cost)
        {
            int distanceTo_u = _distances[u];
            int distanceTo_v = _distances[v];

            if (distanceTo_v > (distanceTo_u + cost))
            {
                _distances[v] = distanceTo_u + cost;
                _routes[v] = u;
            }
        }

        private Vertex<T> GetMinNode(List<Vertex<T>> nodes)
        {
            var minDistance = int.MaxValue;
            Vertex<T> minNode = null;
            foreach (var node in nodes)
            {
                if (_distances[node.Value] <= minDistance)
                {
                    minDistance = _distances[node.Value];
                    minNode = node;
                }
            }

            return minNode;
        }

        public Stack<RoutInfo<T>> GetShortestRoute(T destination)
        {
            Stack<RoutInfo<T>> paths = new Stack<RoutInfo<T>>();
            T current = destination;
            T previous = default(T);

            do
            {
                previous = current;
                current = _routes[current];
                paths.Push(new RoutInfo<T>(current, previous, _distances[previous]));

            } while (!current.Equals(_source));

            return paths;
        }
    }
}
