class hashing {
  int? size;
  List? table;
  hashing(int size) {
    this.size = size;
    table = List.filled(size, []);
  }

  hashFunction(String key) {
    int total = 0;
    for (var i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % size!;
  }

  set(String key, dynamic value) {
    final index = hashFunction(key);
    final bucket = table?[index];
    if (bucket.isEmpty) {
      table?[index] = [
        [key, value]
      ];
    } else {
      final sameKeyItem =
          bucket.firstWhere((item) => item[0] == key, orElse: () => []);
      if (sameKeyItem.isNotEmpty) {
        sameKeyItem[1] = value;
      } else {
        table?[index].add([key, value]);
      }
    }
  }

  get(String key) {
    final index = hashFunction(key);
    final bucket = table?[index];
    if (bucket.isNotEmpty) {
      final sameKeyItem =
          bucket.firstWhere((item) => item[0] == key, orElse: () => []);
      if (sameKeyItem.isNotEmpty) {
        print(sameKeyItem[1]);
      }
    }
    return null;
  }

  display() {
    for (var i = 0; i < size!; i++) {
      print('$i:${table?[i]}');
    }
  }
}

void main(List<String> args) {
  hashing newHash = hashing(10);
  newHash.set('name', 20);
  newHash.set('mane', 50);
  newHash.get('mane');
  newHash.display();
}