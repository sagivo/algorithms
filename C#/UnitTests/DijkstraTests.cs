using Algorithms.Dijkstra;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;

namespace UnitTests
{
    [TestClass]
    public class DijkstraTests
    {
        Random rand = new Random();

        private Graph<T> PrepareGraph<T>(List<T> ids)
        {
            var graph = new Graph<T>();
            foreach (var item in ids)
            {
                graph.AddVertex(item);
            }
            for (int i = 0; i < ids.Count - 2; i++)
            {
                graph.AddEdge(graph.Vertices[i], graph.Vertices[i + 1], (i + 1) % 2 == 0 ? 1 : 2);
                graph.AddEdge(graph.Vertices[i], graph.Vertices[i + 2], (i + 2) % 2 == 0 ? 1 : 2);
            }
            return graph;
        }

        [TestMethod]
        public void DijkstraTest_GetShortestRoute()
        {
            var nodeCount = 1 + rand.Next(2, 5) * 2;
            var ids = new List<Guid>();
            for (int i = 0; i < nodeCount; i++)
            {
                ids.Add(Guid.NewGuid());
            }

            var graph = PrepareGraph(ids);
            var dijkstra = new Dijkstra<Guid>(graph, graph.Vertices.First().Value);
            var routes = dijkstra.GetShortestRoute(ids[nodeCount - 3]);

            for (int i = 0; i <= nodeCount / 2; i += 2)
            {
                var path = routes.Pop();
                Assert.AreEqual(ids[i], path.From);
                Assert.AreEqual(ids[i + 2], path.To);
                Assert.AreEqual((i + 2) / 2, path.Distance);
            }
        }

        [TestMethod]
        public void RouteInfoTests_Properties()
        {
            var expected = CreateRandomRouteInfo();
            var actual = CreateRandomRouteInfo();

            actual.Distance = expected.Distance;
            actual.From = expected.From;
            actual.To = expected.To;

            Assert.AreEqual(expected.ToString(), actual.ToString());

        }

        RoutInfo<Guid> CreateRandomRouteInfo()
        {
            return new RoutInfo<Guid>(Guid.NewGuid(), Guid.NewGuid(), rand.Next());
        }

        [TestMethod]
        public void VertexTest()
        {
            var expectedCost = rand.Next();
            var expectedValue = Guid.NewGuid();

            var vertex = new Vertex<Guid>();
            vertex.Cost.Add(expectedCost);
            vertex.Value = expectedValue;
            vertex.Vertices.Add(vertex);

            Assert.AreEqual(expectedCost, vertex.Cost.Single());
            Assert.AreEqual(expectedValue, vertex.Value);

            Assert.AreEqual(expectedCost, vertex.Vertices.Single().Cost.Single());
            Assert.AreEqual(expectedValue, vertex.Vertices.Single().Value);

            Assert.AreEqual(expectedValue.ToString(), vertex.ToString());
        }

        [TestMethod]
        public void GraphTest()
        {
            var expectedCost = rand.Next();
            var expectedValue = Guid.NewGuid();

            var vertex = new Vertex<Guid>();
            vertex.Cost.Add(expectedCost);
            vertex.Value = expectedValue;

            var graph = new Graph<Guid>();
            graph.AddVertex(vertex);

            Assert.AreEqual(expectedValue, graph.Vertices.Single().Value);
            Assert.AreEqual(expectedCost, graph.Vertices.Single().Cost.Single());
        }
    }
}
