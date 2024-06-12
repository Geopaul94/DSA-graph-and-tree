quickSort(arr){
  int a =arr.length;
if(a<=1){
   return arr;
  // print(arr);
}
int pivot = arr[a~/2];
List smaller=[];
List equal=[];
List larger=[];
int i =0;
while(i<a){
  int num = arr[i];
  if(num<pivot){
    smaller.add(arr[i]);
  }
  else if(num>pivot){
    larger.add(arr[i]);
  }
  else{
    equal.add(arr[i]);
  }
  i++;
}
return [...quickSort(smaller),...equal,...quickSort(larger)];
}
void main(){
  List arr = [9,2,8,6,4,5,7,6];
 
 List sorted= quickSort(arr); 
 print(sorted);
}