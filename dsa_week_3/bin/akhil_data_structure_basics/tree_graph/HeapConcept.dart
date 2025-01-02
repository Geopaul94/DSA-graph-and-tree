class MinHeap {
  late List<int> _heap;

  MinHeap() {
    _heap = [];
  }

  void build(List<int> array) {
    _heap = List.from(array);
    for (int i = (_heap.length ~/ 2) - 1; i >= 0; i--) {
      _heapify(i);
    }
  }

  void insert(int value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  int remove() {
    if (_heap.isEmpty) {
      throw Exception("Heap is empty");
    }
    int removedValue = _heap[0];
    _heap[0] = _heap.last;
    _heap.removeLast();
    _heapify(0);
    return removedValue;
  }

  void _heapify(int index) {
    int smallest = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < _heap.length && _heap[leftChild] < _heap[smallest]) {
      smallest = leftChild;
    }
    if (rightChild < _heap.length && _heap[rightChild] < _heap[smallest]) {
      smallest = rightChild;
    }

    if (smallest != index) {
      _swap(index, smallest);
      _heapify(smallest);
    }
  }

  void _bubbleUp(int index) {
    while (index > 0 && _heap[index] < _heap[(index - 1) ~/ 2]) {
      _swap(index, (index - 1) ~/ 2);
      index = (index - 1) ~/ 2;
    }
  }

  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }

  void printHeap() {
    print(_heap);
  }
}

class MaxHeap {
  late List<int> _heap;

  MaxHeap() {
    _heap = [];
  }

  void build(List<int> array) {
    _heap = List.from(array);
    for (int i = (_heap.length ~/ 2) - 1; i >= 0; i--) {
      _heapify(i);
    }
  }

  void insert(int value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  int remove() {
    if (_heap.isEmpty) {
      throw Exception("Heap is empty");
    }
    int removedValue = _heap[0];
    _heap[0] = _heap.last;
    _heap.removeLast();
    _heapify(0);
    return removedValue;
  }

  void _heapify(int index) {
    int largest = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < _heap.length && _heap[leftChild] > _heap[largest]) {
      largest = leftChild;
    }
    if (rightChild < _heap.length && _heap[rightChild] > _heap[largest]) {
      largest = rightChild;
    }

    if (largest != index) {
      _swap(index, largest);
      _heapify(largest);
    }
  }

  void _bubbleUp(int index) {
    while (index > 0 && _heap[index] > _heap[(index - 1) ~/ 2]) {
      _swap(index, (index - 1) ~/ 2);
      index = (index - 1) ~/ 2;
    }
  }

  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }

  void printHeap() {
    print(_heap);
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.build([3, 2, 1, 5, 4]);
  minHeap.printHeap(); // Output: [1, 2, 3, 5, 4]

  MaxHeap maxHeap = MaxHeap();
  maxHeap.build([3, 2, 1, 5, 4]);
  maxHeap.printHeap(); // Output: [5, 4, 1, 3, 2]
}
