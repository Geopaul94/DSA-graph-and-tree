void main() {
  String a = 'akhil';
  List <String> s = a.split('');
  for (int i = 0; i < a.length; i++) {
    int c = s[i].codeUnits[0]+3;
    if (c<=122){
      s[i]=String.fromCharCode(c);
    }else{
      s[i]=String.fromCharCode(96+c%122);
    }
    
  }
a = s.join('');
  print (a);
}
