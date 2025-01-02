int binary(a,t){

int low=0;
int high= a.length-1;
while (low<=high) {
  int mid = (low+high)~/2;
  if(a[mid] ==t){
    return t;
  }else if(a[mid]<t){
    low=mid+1;
    
  }
  else if(a[mid]>t){
    high = mid-1;

  }
  
}
 return -1;
}
void main(){
  List  arr =[1,2,3,4,5,6] ;
  int res = binary(arr, 0);
  if(res!=-1){
    print('result found ');
  }
  else {
    print("Element not found in the array.");
  }
}