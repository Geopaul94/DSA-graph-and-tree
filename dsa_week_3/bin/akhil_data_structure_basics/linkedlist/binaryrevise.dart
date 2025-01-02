void binary(arr,tar){
  int l= 0;
  int h=arr.length-1;
  while(l<=h){
    int mid = (h+l)~/2;
    if(tar == arr[mid]){
      print('value found @ $mid');
      return;
    }else if(tar<arr[mid]){
      h=mid-1;
    }else{
      l = mid +1;
    }
  }
  print('sorry not found');
}
void main(List<String> args) {
  List a = [1,2,3,4,5];
  binary(a, 6
  );
}