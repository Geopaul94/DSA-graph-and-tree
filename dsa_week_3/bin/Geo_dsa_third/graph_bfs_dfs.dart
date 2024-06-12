class Graph {
  late final int V; // Number of vertices
  late final List<List<int>> adj; // Adjacency list

  Graph(int vertices) {
    V = vertices;
    adj = List.generate(V, (_) => []);
  }

  // Function to add an edge between two vertices
  void addEdge(int v, int w) {
    adj[v].add(w);
    adj[w].add(v); // For undirected graph
  }

  // Function for BFS traversal
  void bfs(int startVertex) {
    var visited = List<bool>.filled(V, false);
    var queue = [startVertex];

    visited[startVertex] = true;

    while (queue.isNotEmpty) {
      var s = queue.removeAt(0);
      print("$s ++++");

      for (final node in adj[s]) {
        if (!visited[node]) {
          visited[node] = true;
          queue.add(node);                                                                                                                               
        }
      }
    }
  }

  // Function for DFS traversal
  void dfs(int startVertex) {
    var visited = List<bool>.filled(V, false);
    dfsU(startVertex, visited); 
  }

  // Recursive function for DFS traversal
  void dfsU(int v, List<bool> visited) {
    visited[v] = true;
    print("$v =====");

    for (final node in adj[v]) {
      if (!visited[node]) {
        dfsU(node, visited);
      }
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

  print("BFS Traversal:");
  graph.bfs(3);

  print("\nDFS Traversal:");
  graph.dfs(2);
}