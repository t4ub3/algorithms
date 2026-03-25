import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'helpers.dart';

const String welcome =
    "Let's roll the dice! We go until we roll two 6s in a row. What do you think how many rolls we will need?";
String? input;
int estimatedRolls = 0;

void main() {
  print(welcome);
  input = stdin.readLineSync();
  while (!Helpers().isPostiveIntegerString(input)) {
    print(hint(input));
    input = stdin.readLineSync();
  }

  estimatedRolls = int.parse(input!);
  rollDice(estimatedRolls);
  //   print(numberOfRolls);
}

String hint(String? input) {
  return "${Helpers().isNullOrEmpty(input) ? "That" : "\"${input}\""} is not a valid Input. Please enter a positive Integer!";
}

void rollDice(int amount) {
  var rolls = [];
  for (var i = 0; i < amount; i++) {
    int x = Random().nextInt(6) + 1;
    rolls.add(x);
    if (i > 0) {
      if (x == 6 && x == rolls[i - 1]) {
        printSuccess(rolls);
        return;
      }
    }
  }
  print(
    "Sorry, we didn't manage to roll two 6s. Here are our rolls: \n ${rolls.toString()}",
  );
}

void printSuccess(List rolls) {
  double percentage;
  percentage = rolls.length / estimatedRolls;
  print(
    "Congratulations! We rolled two 6s in a row. It took ${rolls.length.toString()} rolls. That is only ${percentage.toStringAsFixed(1)}% of your estimated ${estimatedRolls.toString()} rolls. Here are all rolls: ${rolls.toString()}",
  );
}
