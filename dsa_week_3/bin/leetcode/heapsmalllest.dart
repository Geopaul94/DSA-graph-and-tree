

heap(List<int> list) {
  int n = list.length;

  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(list, n, i);
  }
  for (int i = n - 1; i > 0; i--) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;

    heapify(list, i, 0);
  }
}

heapify(List<int> list, int n, int i) {
  int smallest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && list[left] < list[smallest]) {
    smallest = left;
  }
  if (right < n && list[right] < list[smallest]) {
    smallest = right;
  }
  if (smallest != i) {
    int temp = list[i];
    list[i] = list[smallest];
    list[smallest] = temp;

    heapify(list, n, smallest);
  }
}

void main() {
  List<int> list = [10, 5, -8, 65, 50, 4, 8];
  heap(list);
  print(list);
}
