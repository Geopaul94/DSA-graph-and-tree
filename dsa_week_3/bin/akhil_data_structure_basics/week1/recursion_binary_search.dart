

import 'dart:io';

int recBin(arr,tar,low,high){
if (low<=high){
  int mid = (low+high)~/2;
  if(arr[mid]==tar){
    return mid;

  }if(tar<arr[mid]){
    return recBin(arr, tar, low, mid-1);
  }
  return recBin(arr, tar, mid+1, high);
}
  
return -1;
}
void main(List<String> args) {
  List arr = [1,2,3,4,5,6,7,8];
  int high = arr.length-1;
  int low = 0;
  int tar;
  print('enter the target');
 tar = int.parse(stdin.readLineSync()!);
  int res = recBin(arr, tar, low, high);
  if (res!= -1){
    print('value is there');
  }else{
    print('not found');
  }
}