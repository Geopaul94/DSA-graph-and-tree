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

  // Function for BFS traversal
  void bfs(int startVertex) {
    // Mark all vertices as not visited
    var visited = List<bool>.filled(V, false);

    // Create a queue for BFS
    var queue = [];

    // Mark the current node as visited and enqueue it
    visited[startVertex] = true;
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      // Dequeue a vertex from queue and print it
      var s = queue.removeAt(0);
      print("$s ");

      // Get all adjacent vertices of the dequeued vertex s
      // If an adjacent has not been visited, then mark it visited and enqueue it
      for (final node in adj[s]) {
        if (!visited[node]) {
          visited[node] = true;
          queue.add(node);
        }
      }
    }
  }

  // A recursive function to do DFS traversal starting from vertex v
  void dfsUtil(int v, List<bool> visited) {
    // Mark the current node as visited and print it
    visited[v] = true;
    print("$v ");

    // Recur for all the vertices adjacent to this vertex
    for (final node in adj[v]) {
      if (!visited[node]) {
        dfsUtil(node, visited);
      }
    }
  }

  // Function for DFS traversal
  void dfs(int startVertex) {
    // Mark all the vertices as not visited (set as false by default in Dart)
    var visited = List<bool>.filled(V, false);

    // Call the recursive helper function to print DFS traversal
    dfsUtil(startVertex, visited);
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
  graph.bfs(2); // Perform BFS traversal starting from vertex 2

  print("\nDFS Traversal:");
  graph.dfs(2); // Perform DFS traversal starting from vertex 2
}
