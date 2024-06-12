void heapSort(List<int> arr) {
  int n = arr.length;

  // Build min heap
  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    minHeapify(arr, n, i);
  }

  // Extract elements from heap one by one
  for (int i = n - 1; i > 0; i--) {
    
    // Swap root (minimum element) with the last element
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    // Heapify the reduced heap
    minHeapify(arr, i, 0);
  }
}

void minHeapify(List<int> arr, int n, int i) {
  int smallest = i; // Initialize smallest as root
  int left = 2 * i + 1; // Left child
  int right = 2 * i + 2; // Right child

  // If left child is smaller than root
  if (left < n && arr[left] > arr[smallest]) {
    smallest = left;
  }

  // If right child is smaller than smallest so far
  if (right < n && arr[right] > arr[smallest]) {
    smallest = right;
  }

  // If smallest is not root
  if (smallest != i) {
    int temp = arr[i];
    arr[i] = arr[smallest];
    arr[smallest] = temp;

    // Recursively heapify the affected sub-tree
    minHeapify(arr, n, smallest);
  }
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6, 50];
  print('Original array: $arr');
  
  heapSort(arr);

  print('Sorted array: $arr');
}
