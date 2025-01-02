class Graph {
  late final int V; // Number of vertices
  late final List<List<int>> adj; // Adjacency list

  Graph(int vertices) {
    this.V = vertices;
    adj = List.generate(V, (_) => []);
  }

  // Function to add an edge between two vertices
  void addEdge(int v, int w) {
    adj[v].add(w);
    adj[w].add(v); // For undirected graph
  }

  // Function to print the adjacency list representation of the graph
  void printGraph() {
    for (int v = 0; v < V; ++v) {
      print("Adjacency list of vertex $v");
      print("head");
      for (final node in adj[v]) {
        print(" -> $node");
      }
      print("\n");
    }
  }
}

void main() {
  final graph = Graph(5);
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  // Print the adjacency list representation of the graph
  graph.printGraph();
}
