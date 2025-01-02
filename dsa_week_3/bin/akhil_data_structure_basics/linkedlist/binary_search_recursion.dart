int binarySearch(List<int> arr, int target, int low, int high) {
  if (low <= high) {
    int mid = low + (high - low) ~/ 2;
    if (arr[mid] == target) {
      return mid;
    }

    if (target < arr[mid]) {
      return binarySearch(arr, target, low, mid - 1);
    }

   
    return binarySearch(arr, target, mid + 1, high);
  }


  return -1;
}

void main() {
  List<int> sortedArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int target = 100;

  int result = binarySearch(sortedArray, target, 0, sortedArray.length - 1);

  if (result != -1) {
    print("Element $target found at index $result.");
  } else {
    print("Element $target not found in the array.");
  }
}
