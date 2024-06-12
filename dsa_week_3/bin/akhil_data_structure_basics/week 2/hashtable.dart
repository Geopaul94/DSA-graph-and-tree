class hashing {
  int? size;
  List? table;
  hashing(int size) {
    this.table = List.filled(size, null);
    this.size = size;
  }
  hash(String key) {
    int total = 0;
    for (var i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % size!;
  }

  set(key, value) {
    int index = hash(key);
    table?[index] = value;
  }

  get(key) {
    int index = hash(key);
    print(table?[index]);
  }

  display() {
    for (var i = 0; i < table!.length; i++) {
      if (table?[i]!=null) {
        print('$i:${table?[i]}');
      }
    }
  }
}

void main(List<String> args) {
  hashing table = hashing(10);
  table.set('sreeraj', 50);
  table.set('sojin', 9);
  table.get('sojin');
  // table.get('sreeraj');
  table.display();
}