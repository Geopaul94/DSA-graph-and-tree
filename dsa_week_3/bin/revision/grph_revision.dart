class Graph {
  late final int V;
  late final List<List<int>> adj;

  Graph(int vertices) {
    V = vertices;

    adj = List.generate(V, (_) => []);
  }

  void addEdge(int v, int w) {
    adj[v].add(w);
    adj[w].add(v);
  }

  void bfs(int startvertex) {
    var visited = List<bool>.filled(V, false);
    var queue = [startvertex];
    visited[startvertex] = true;
    while (queue.isNotEmpty) {
      var q = queue.removeAt(0);
      print(q);
      for (var node in adj[q]) {
        if (!visited[node]) {
          visited[node] = true;
          queue.add(node);
        }
      }
    }
  }

  void dfs(int startvertex) {
    var visited = List<bool>.filled(V, false);
    df(startvertex, visited);
  }

  df(int q, List<bool> visited) {
    visited[q] = true;

    print(q);

    for (var node in adj[q]) {
      if (!visited[node]) {
        df(node, visited);
      }
    }
  }
}
