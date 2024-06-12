selectionSort(arr){
int a = arr.length;
for (var i = 0; i < a; i++) {
  int min = i;
  for(int j =i+1;j<a;j++){
    if(arr[j]<arr[min]){
      min=j;
    }
  }
  int temp = arr[min];
  arr[min]=arr[i];
  arr[i]=temp;

}
print(arr);
}
void main(){
  List arr= [5,8,7,6,4,7,2,6,1];
  selectionSort(arr);
}