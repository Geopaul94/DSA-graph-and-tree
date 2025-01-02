void main (){
  List <int > a = [1,3,2,7,9,4,6,3];
  List <int> b= bubbleSortaAscending(a);
  print (b);
  List <int> c= bubbleSortAcending2(a);
  print(c);
  List <int> d= bubbleSortAcending3(a);
  print(d);
}

List<int> bubbleSortaAscending(List<int> a) {
  for (var i = 0; i < a.length; i++) {
    for (var j = i+1; j <a.length; j++) {
      if(a[i]>a[j]){
        int temp = a[i];
        a[i]=a[j];
        a[j]=temp;
      }
    }
    
  }
  return a;
}
List <int> bubbleSortAcending2(List <int>a ){
  for (var i = 0; i < a.length-1; i++) {

   
      if(a[i]>a[i+1]){
       int temp = a[i];
        a[i]=a[i+1];
        a[i+1]=temp;
        i=-1;
    }

    
    
  }
  return a;

}
List <int> bubbleSortAcending3(List <int>a ){
  for (var i = 0; i < a.length-1; i++) {
    for (var j = 0; j < a.length-i-1; j++) {
      if(a[j]>a[j+1]){
        int temp = a[j];
        a[j]=a[j+1];
        a[j+1]= temp;

      }
    }
    
  }
  return a;
}