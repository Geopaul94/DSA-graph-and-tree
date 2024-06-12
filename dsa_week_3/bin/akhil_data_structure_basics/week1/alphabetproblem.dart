import 'dart:io';

void main() {
 print('enter the string');
  String? value = stdin.readLineSync()??' ';
  String nval = value.toLowerCase();
 
 print('enter the count for each alphabet added');
  int n = int.parse(stdin.readLineSync()!); 

  List<String> lis = nval.split('');

  for (var i = 0; i < lis.length; i++) {
    int letter = lis[i].codeUnits[0] + n;

    if (letter <= 122) {
      lis[i] = String.fromCharCode(letter);
    } else {
      lis[i] = String.fromCharCode(96+ letter % 122);
    }
  }
  value = lis.join('');
 print(value);
}