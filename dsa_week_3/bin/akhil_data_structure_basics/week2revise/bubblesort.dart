bubbleSort(arr){
for (var i = 0; i < arr.length-1; i++) {
  for (int j = 0;j<arr.length-i-1;j++){
    if(arr[j]>arr[j+1]){
      int temp = arr[j];
      arr[j]= arr[j+1];
      arr[j+1]= temp;
    }
  }
}
print (arr);
}
void main(){
  List <int > arr = [1,3,2,7,9,4,6,3];
bubbleSort(arr);
}