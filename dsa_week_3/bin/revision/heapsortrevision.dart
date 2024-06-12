heapsort(List<int> list) {
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

void heapify(List<int> list, int n, int i) {
  int l = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && list[left] > list[l]) {
    l = left;
  }
  if (right < n && list[right] > list[l]) {
    l = right;
  }
  if (l != i) {
    int temp = list[i];
    list[i] = list[l];
    list[l] = temp;

    heapify(list, n, l);
  }
}

void main() {
  List<int> list = [5, 4, 8, 2, 54, 6, 2, 5, 65];
  heapsort(list);
  print(list);
}
