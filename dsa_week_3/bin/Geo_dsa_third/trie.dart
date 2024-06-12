class TrieNode {
  final Map<String, TrieNode> children;
  bool isEndOfWord;

  TrieNode()
      : children = {},
        isEndOfWord = false;
}

class Trie {
  TrieNode root;

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
  } // Function to display all inserted words

  void displayInsertedWords() {
    List<String> words = [];
    _collectWords(root, "", words);
    print("Inserted words: $words");
  }

  // Helper function for depth-first traversal to collect words
  void _collectWords(TrieNode node, String currentWord, List<String> words) {
    if (node.isEndOfWord) {
      words.add(currentWord);
    }

    node.children.forEach((char, childNode) {
      _collectWords(childNode, currentWord + char, words);
    });
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

  void printWordsWithPrefix(Trie trie, String prefix) {
    TrieNode? node = trie.searchNode(prefix);
    if (node != null) {
      List<String> words = [];
      _collectWordsWithPrefix(node, prefix, words);
      print(words);
    } else {
      print("No words found with the prefix '$prefix'.");
    }
  }

  void _collectWordsWithPrefix(
      TrieNode node, String currentWord, List<String> words) {
    if (node.isEndOfWord) {
      words.add(currentWord);
    }

    node.children.forEach((char, childNode) {
      _collectWordsWithPrefix(childNode, currentWord + char, words);
    });
  }
}

void main() {
  Trie trie = Trie();

  // Inserting words
  trie.insert("apple");
  trie.insert("banana");
  trie.insert("bananattpknmvbgtgg");
  trie.insert("bananattpk");
  print('+++++++++++++++');
  trie.displayInsertedWords();
  // Searching for words
  print(trie.search("apple")); // true
  print(trie.search("app")); // false

  // Checking prefix
  print(trie.startsWith("ban"));
  // true
  trie.printWordsWithPrefix(trie, "ban");
  // Deleting a word
  // trie.delete("apple");
  // print(trie.search("apple")); // false
}
