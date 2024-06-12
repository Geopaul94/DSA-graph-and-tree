void heapSort(List<int> arr) {
  int n = arr.length;

  // Build max heap
  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    

    maxHeapify(arr, n, i);
    
  }

  // Extract elements from heap one by one
  for (int i = n - 1; i > 0; i--) {
    // Swap root (maximum element) with the last element
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    // Heapify the reduced heap

   
    maxHeapify(arr, i, 0); 
   
   
  }
}

void maxHeapify(List<int> arr, int n, int i) {
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
    maxHeapify(arr, n, largest);
  }
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6, 50];
  print('Original array: $arr');

  heapSort(arr);

  print('Sorted array: $arr');
}
