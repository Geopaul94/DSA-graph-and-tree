mergeSort(List arr){
if(arr.length<=1){
  return arr;
}
int mid = arr.length~/2;
List left = arr.sublist(0,mid);
List right = arr.sublist(mid);
return merge(left,right);
}
 merge(left,right){
// List result =[];

 }