class Graph {
 late int vertices;
  List<List<int>> adjacencyList = [];

  Graph( int v) {
    vertices = v;
    adjacencyList = List<List<int>>.generate(vertices, (_) => []);
  }

  void addEdge(int v, int w) {
    adjacencyList[v].add(w); // Add w to v's list
    adjacencyList[w].add(v); // If undirected graph, add v to w's list
  }

  void printGraph() {
    for (int v = 0; v < vertices; ++v) {
      print("Adjacency list of vertex $v");
      print("head");
      for (final vertex in adjacencyList[v]) {
        print(" -> $vertex");
      }
      print("\n");
    }
  }
}

void main() {
  int vertices = 5;
  Graph graph = Graph(vertices);
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  graph.printGraph();
}
