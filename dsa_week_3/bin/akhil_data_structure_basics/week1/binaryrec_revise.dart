

void binrec(arr,tar,high,low){
  if(low<=high){
    int mid = (low+high)~/2;
    if(tar ==arr[mid]){
      print('found @ $mid');
      return;
    }
    if(tar<arr[mid]){
      binrec(arr, tar, mid-1, low);

    }
    else{
      binrec(arr, tar, high, mid+1);
    }
  }
  else{
    print('not found');
  }
}
void main(List<String> args) {
  List arr = [1,2,3,4,5,7,8,9] ;
  int low = 0;
  int high = arr.length-1;
  int tar = 10;
  binrec(arr, tar, high, low);
}