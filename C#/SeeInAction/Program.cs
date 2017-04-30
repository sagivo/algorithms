using Algorithms.Dijkstra;
using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace SeeInAction
{
    class Program
    {
        static string GRAPH_FILE_NAME = @"Data\DijkstraSample.txt";
        static Graph<string> SoCalMap = new Graph<string>();

        static void Main(string[] args)
        {
            LoadGraphData();
            string source = "Los Angeles";
            string destination = "El Cajon";

            var dijkstra = new Dijkstra<string>(SoCalMap, source);
            var result = dijkstra.GetShortestRoute(destination);
            var distance = 0;

            Console.WriteLine("Shortest route from '{0}' to '{1}' is as follows\n", source, destination);
            while (result.Count != 0)
            {
                var path = result.Pop();
                Console.WriteLine("{0}\t->\t{1}\t[{2} miles]", path.From, path.To, path.Distance - distance);
                distance = path.Distance;
            }
            Console.WriteLine("\nShortest path has a distance of {0} miles\n", distance);
        }

        private static void LoadGraphData()
        {
            try
            {
                // populate the graph with the data from the file
                StreamReader sr = File.OpenText(GRAPH_FILE_NAME);

                // iterate through each line
                string line = sr.ReadLine();
                while (line != null)
                {
                    // get the city names and distance					
                    line = Regex.Replace(line, "\"(.*?) (.*?)\"", "$1_$2");

                    string city1 = Regex.Replace(line, "^(.*?) (.*?) (\\d+)$", "$1").Replace('_', ' ');
                    string city2 = Regex.Replace(line, "^(.*?) (.*?) (\\d+)$", "$2").Replace('_', ' ');
                    int distance = Convert.ToInt32(Regex.Replace(line, "^(.*?) (.*?) (\\d+)$", "$3"));

                    // add the nodes to the graph, if needed
                    var c1 = new Vertex<string> { Value = city1 };
                    var c2 = new Vertex<string> { Value = city2 };
                    if (!SoCalMap.Vertices.Any(v => v.Value == c1.Value))
                        SoCalMap.AddVertex(c1);
                    if (!SoCalMap.Vertices.Any(v => v.Value == c2.Value))
                        SoCalMap.AddVertex(c2);
                    SoCalMap.AddEdge(c1, c2, distance);

                    line = sr.ReadLine();
                }

                sr.Close();
            }
            catch (Exception)
            {
            }
        }
    }
}
