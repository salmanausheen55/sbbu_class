import 'dart:io';
void main() {
  stdout.write("Hi, please choose a number... I will tell You that it is EVEN or ODD: ");
  int number = int.parse(stdin.readLineSync() ?? "0");
   
  if (number % 2 == 0){
    print("The number which is chosen by you is EVEN");

  }
  else {
    print("The number which is chosen by you is ODD");
  }
}