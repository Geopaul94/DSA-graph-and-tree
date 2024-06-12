selectionSort(arr){
  int n = arr.length;
  for (int i = 0 ; i<n-1;i ++){
    int minIndex = i;
    for (var j = i+1; j < n; j++) {
      if(arr[j]<arr[minIndex]){
        minIndex=j;
      }
    }
    int temp = arr[minIndex];
    arr[minIndex]= arr[i];
    arr[i]=temp;
  }
  print(arr);
}
void main(){
  List arr = [9,2,8,6,4,5,7,6];
  selectionSort(arr); 
}