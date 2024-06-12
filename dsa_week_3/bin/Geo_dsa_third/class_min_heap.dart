class MinHeap {
  List<int> heap = [];

  // Insert an element into the min heap
  void insert(int value) {
    heap.add(value);
    _bubbleUp(heap.length - 1);
  }

  // Remove and return the minimum element from the min heap
  int? removeMin() {
    if (heap.isEmpty) return null;
    int minValue = heap[0];
    heap[0] = heap.removeLast();
    _heapify(0);
    return minValue;
  }

  // Convert an array into a min heap
  void buildMinHeap(List<int> array) {
    heap = List.from(array);
    for (int i = (heap.length ~/ 2) - 1; i >= 0; i--) {
      _heapify(i);
    }
  }

  // Helper method to maintain the min heap property
  void _heapify(int index) {
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int smallest = index;

    if (leftChildIndex < heap.length && heap[leftChildIndex] < heap[smallest]) {
      smallest = leftChildIndex;
    }
    if (rightChildIndex < heap.length && heap[rightChildIndex] < heap[smallest]) {
      smallest = rightChildIndex;
    }
    if (smallest != index) {
      _swap(index, smallest);
      _heapify(smallest);
    }
  }

  // Helper method to maintain the heap property after insertion
  void _bubbleUp(int index) {
    if (index == 0) return;
    int parentIndex = (index - 1) ~/ 2;
    if (heap[index] < heap[parentIndex]) {
      _swap(index, parentIndex);
      _bubbleUp(parentIndex);
    }
  }

  // Helper method to swap two elements in the heap
  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  // Display the elements of the min heap
  void display() {
    print(heap);
  }
}

void main() {
  var minHeap = MinHeap();
  minHeap.insert(10);
  minHeap.insert(5);
  minHeap.insert(20);
  minHeap.insert(3);
  minHeap.insert(8);
  
  minHeap.display();

  minHeap.removeMin();
  minHeap.display();
}