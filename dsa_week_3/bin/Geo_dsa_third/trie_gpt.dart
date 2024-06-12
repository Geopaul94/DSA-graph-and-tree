class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = TrieNode();
      }
      current = current.children[char]!;
    }
    current.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode? current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current!.children.containsKey(char)) {
        return false;
      }
      current = current.children[char];
    }
    return current != null && current.isEndOfWord;
  }

  bool startsWith(String prefix) {
    TrieNode? current = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!current!.children.containsKey(char)) {
        return false;
      }
      current = current.children[char];
    }
    return true;
  }

  bool _deleteHelper(String word, TrieNode node, int index) {
    if (index == word.length) {
      if (!node.isEndOfWord) {
        return false; // Word not found in trie
      }
      node.isEndOfWord = false;
      return node.children.isEmpty; // Delete node only if it has no children
    }

    String char = word[index];
    if (!node.children.containsKey(char)) {
      return false; // Word not found in trie
    }

    TrieNode nextNode = node.children[char]!;
    bool shouldDeleteNode = _deleteHelper(word, nextNode, index + 1);

    if (shouldDeleteNode) {
      node.children.remove(char);
      return node.children.isEmpty && !node.isEndOfWord;
    }

    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  print(trie.search("apple")); // true
  print(trie.search("app")); // false
  print(trie.startsWith("app")); // true
  trie.insert("app");
  print(trie.search("app")); // true
}
