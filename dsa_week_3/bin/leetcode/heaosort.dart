void sort(List<int> list) {
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

heapify(List<int> arry, int n, int i) {
  int larget = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && arry[left] < arry[larget]) {
    larget = left;
  }
  if (right < n && arry[right] < arry[larget]) {
    larget = right;
  }
  if (larget != i) {
    int temp = arry[i];
    arry[i] = arry[larget];
    arry[larget] = temp;

    heapify(arry, n, larget);
  }
}

void main() {
  List<int> array = [10 - 5, 20, 50, 41, 5, 1, 52, 5];
  sort(array);
  print(array);
}
