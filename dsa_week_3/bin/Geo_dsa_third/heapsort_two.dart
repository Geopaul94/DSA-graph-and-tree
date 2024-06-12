void heapSort(List<int> arr) {
  int n = arr.length;

  // Build max heap
  buildMaxHeap(arr, n);

  // Extract elements from heap one by one
  for (int i = n - 1; i > 0; i--) {
    // Swap root (maximum element) with the last element
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    // Heapify the reduced heap
    heapify(arr, i, 0);
  }
}

void buildMaxHeap(List<int> arr, int n) {
  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i; // Initialize largest as root
  int left = 2 * i + 1; // Left child
  int right = 2 * i + 2; // Right child

  // If left child is larger than root
  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  // If right child is larger than largest so far
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  // If largest is not root
  if (largest != i) {
    int temp = arr[i];
    arr[i] = arr[largest];
    arr[largest] = temp;

    // Recursively heapify the affected sub-tree
    heapify(arr, n, largest);
  }
}

void insert(List<int> arr, int value) {
  arr.add(value);
  int index = arr.length - 1;
  while (index > 0) {
    int parentIndex = (index - 1) ~/ 2;
    if (arr[parentIndex] < arr[index]) {
      // Swap parent and child
      int temp = arr[parentIndex];
      arr[parentIndex] = arr[index];
      arr[index] = temp;
      index = parentIndex;
    } else {
      break;
    }
  }
}

int? removeMax(List<int> arr) {
  if (arr.isEmpty) return null;
  int maxValue = arr[0];
  arr[0] = arr.removeLast();
  heapify(arr, arr.length, 0);
  return maxValue;
}

void main() {
  List<int> arr = [10, 5, 20, 3, 8];
  print('Original array: $arr');

  // Insertion
  insert(arr, 15);
  print('After insertion: $arr');

  // Removal
  int? max = removeMax(arr);
  print('Removed max value: $max');
  print('After removal: $arr');

  // Build max heap
  buildMaxHeap(arr, arr.length);
  print('Max heap: $arr');

  // Heap sort
  heapSort(arr);
  print('Sorted array: $arr');
}
