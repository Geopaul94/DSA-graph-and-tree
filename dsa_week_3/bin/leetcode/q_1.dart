// import 'dart:math';

// void main() {
//   List<int> nums = [10, 45, 12, 6, 578, 45, 5];

//   int mino = nums.reduce(min);
//   int maxno = nums.reduce(max);

//   // nums.sort();
//   List<int> a = [];

//   for (int i = 0; i < nums.length - 1; i++) {
//     for (int j = i + 1; j < nums.length; j++) {
//       if (nums[i] > nums[j]) {
//         int temp = nums[i];
//         nums[i] = nums[j];
//         nums[j] = temp;
//         a.add(nums[j]);
//       }
//     }
//   }
//   print(mino);
//   print(maxno);
//   print(nums);
//   print(a);
// }

void main() {
 String str1 = "   fly me   to   the moon  ";
  //String str = "luffy is still joyboy";

  dynamic countSpaces(String str) {
    List<dynamic> arr = str.split('');
    for (int i = arr.length; i >= 0;i--){
      if(arr[i].toString().trim().length>0 ){




      return countSpaces;
      }
    }
     
  }

  
}
