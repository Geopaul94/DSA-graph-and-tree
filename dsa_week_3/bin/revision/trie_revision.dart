class Trienode {
  bool isEndword = false;
  final Map<String, Trienode> children = {};
}

class Trie {
  Trienode root = Trienode();
  void insert(String word) {
    Trienode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = Trienode();
      }
      current = current.children[char]!;
    }
    current.isEndword = true;
  }

  List<String> Startwith(String prefix) {
    List<String> result = [];
    Trienode current = root;
    for (int i = 0; i < prefix.length; i++) {
      String pref = prefix[i];
      if (!current.children.containsKey(pref)) {
        return result;
      }
      current = current.children[pref]!;
    }

    collectionwords(current, prefix, result);
    return result;
  }

  collectionwords(Trienode current, String prefix, List<String> result) {
    if (current.isEndword) {
      return result.add(prefix);
    }
    for (var entry in current.children.entries) {
      String pref = entry.key;

      Trienode childnode = entry.value;

      collectionwords(childnode, prefix + pref, result);
    }
  }

  void printAllWords() {
    List<String> result = [];
    _dfs(root, '', result);
    for (String word in result) {
      print(word);
    }
  }

  void _dfs(Trienode node, String prefix, List<String> result) {
    if (node.isEndword) {
      result.add(prefix);
    }
    node.children.forEach((char, childNode) {
      _dfs(childNode, prefix + char, result);
    });
  }
}

void main() {
  Trie trie = Trie();
  trie.insert('word');
  trie.insert('wooooo');
  trie.insert('woooowww');
  trie.insert('nooooo');
  trie.insert('walking');
  trie.insert('word');
  print(trie.Startwith("w"));
 trie. printAllWords();
}
