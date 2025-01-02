int binarySearch(List<int> arr, int target) {
  int low = 0;
  int high = arr.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;

    if (arr[mid] == target) {
      return mid; // Target found
    } else if (arr[mid] < target) {
      low = mid + 1; // Search in the right half
    } else {
      high = mid - 1; // Search in the left half
    }
  }

  return -1; // Target not found
}

void main() {
  List<int> sortedArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int target = 7;

  int result = binarySearch(sortedArray, target);

  if (result != -1) {
    print("Element $target found at index $result.");
  } else {
    print("Element $target not found in the array.");
  }
}
