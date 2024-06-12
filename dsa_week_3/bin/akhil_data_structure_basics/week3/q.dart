

List<int>  addone(List<int> list) {
  List<int> result = [];

  for (int i = 0; i < list.length; i++) {
    int count = i + 1;
    result.add(list[i] + count);
  }
  return result;
}

void main() {
  List<int> list = [3, 8, 1, 4, 7];
  
var a =addone(list);
  print(a);
}
