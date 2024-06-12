class TrieNode {
  final Map<String, TrieNode> children;
  bool isEndOfWord;

  TrieNode() : children = {}, isEndOfWord = false;
}

class Trie {
  final TrieNode root;

  Trie() : root = TrieNode();

  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode();
      }
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode? node = searchNode(word);
    return node != null && node.isEndOfWord;
  }

  bool startsWith(String prefix) {
    TrieNode? node = searchNode(prefix);
    return node != null;
  }

  TrieNode? searchNode(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (node.children.containsKey(char)) {
        node = node.children[char]!;
      } else {
        return null;
      }
    }
    return node;
  }

  void delete(String word) {
    _deleteHelper(root, word, 0);
  }

  bool _deleteHelper(TrieNode node, String word, int depth) {
    if (depth == word.length) {
      if (!node.isEndOfWord) return false;
      node.isEndOfWord = false;
      return node.children.isEmpty;
    }

    String char = word[depth];
    if (!node.children.containsKey(char)) {
      return false;
    }

    bool shouldDeleteCurrentNode =
        _deleteHelper(node.children[char]!, word, depth + 1);

    if (shouldDeleteCurrentNode) {
      node.children.remove(char);
      return node.children.isEmpty && !node.isEndOfWord;
    }

    return false;
  }
}

void main() {
  Trie trie = Trie();
  
  // Inserting words
  trie.insert("apple");
  trie.insert("banana");
  
  // Searching for words
  print(trie.search("apple")); // true
  print(trie.search("app"));   // false
  
  // Checking prefix
  print(trie.startsWith("ban")); // true
  
  // Deleting a word
  trie.delete("apple");
  print(trie.search("apple")); // false
}
