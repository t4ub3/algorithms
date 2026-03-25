import 'dart:io';
import 'helpers.dart';

void main() {
  print("Hi! Please enter a positive integer!");

  // validate input -->
  var input = stdin.readLineSync();
  while (!Helpers().isPostiveIntegerString(input)) {
    print(hint(input));
    input = stdin.readLineSync();
  }
  final userInt = int.parse(input!);
  // <-- validate input

  List<int> primes = [];
  // start at 2 because 1 is no prime
  for (var i = 2; i < userInt + 1; i++) {
    if (countDividers(i) == 2) {
      primes.add(i);
    }
  }
  print(primes.toString());
}

String hint(String? input) {
  return "${Helpers().isNullOrEmpty(input) ? "That" : "\"${input}\""} is not a valid Input. Please enter a positive Integer!";
}

int countDividers(int number) {
  int count = 0;
  for (var i = 1; i < number + 1; i++) {
    if (number % i == 0) {
      count++;
      if (count > 2) {
        break;
      }
    }
  }
  return count;
}
