int factorial(int n){
  
  if (n<=1){
    return 1;
  }else{
    
    int fact;
    return fact = n* factorial(n-1);
  }
}

int fibunaci(int n){
  if (n<=1){
    return n;
  }
    else{
      return fibunaci(n-1)+fibunaci(n-2);

    }
  }

void main(List<String> args) {
  print(factorial(5));
  print('fibunacii..');
  int n = 5;
  for (var i = 0; i < n; i++) {
    print(fibunaci(i));
    
  }

}