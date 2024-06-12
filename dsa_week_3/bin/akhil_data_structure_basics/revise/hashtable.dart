class Hash{
  int? size;
  List? table;
  Hash(int size) {
    this.table = List.filled(size, null);
    this.size=size;
  }
hashing(String key){
 int total = 0;
  for (var i = 0; i < key.length; i++) {
     total=total+ key.codeUnitAt(i);
  }
  return total%size!;

}
set(key,value){
  int index = hashing(key);
 table?[index]=value;
  
}
get(key){
int index =hashing(key);
print(table?[index]);
}
display(){
  for(int i =0;i<table!.length;i++){
    if(table?[i]!=null){
print('$i : ${table?[i]}');
    }
  }
}
remove(key){
int index =hashing(key);
table?[index]=null;
}


}
void main (){
  Hash newHash =Hash(10);
  newHash..set('name', 'akhil')..set('age', '24')..display()..get('age')..remove('name')..display();
}