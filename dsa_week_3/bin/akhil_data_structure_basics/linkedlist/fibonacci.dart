int fibonacci (int n ){
  if(n<=1){
    return n;
  }else{
    return fibonacci(n-1) + fibonacci(n-2);
  }

}
void main(){
  int a = 10;
  print('fibonacci up to 10:');
  for (var i = 0; i < a; i++) {
    print(fibonacci(i));
  }
}