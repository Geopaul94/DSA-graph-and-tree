insertionSort(arr){
  int a = arr.length;
  for (var i = 1; i <a; i++) {
    int temp = arr[i];
    int j = i-1;
    while(j>=0&&arr[j]>temp){
      arr[j+1]=arr[j];
      j--;

    }
    arr[j+1]= temp;
    
  }
print(arr);
}
void main(){
  List arr= [5,8,7,6,4,7,2,6,1];
  insertionSort(arr);
}