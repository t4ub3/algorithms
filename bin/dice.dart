import 'dart:io';

const String welcome =
    "Let's roll the dice! We go until we roll two 6s in a row. What do you think how many rolls we will need?";
String? input;
int numberOfRolls = 0;

void main() {
  print(welcome);
  input = stdin.readLineSync();
  while (!isValidInput(input)) {
    hint(input);

    input = stdin.readLineSync();
  }
  //   do {
  //     input = stdin.readLineSync();
  //     hint(input);
  //   } while (!isValidInput(input));

  numberOfRolls = int.parse(input!);
  print(numberOfRolls);
}

String hint(String? input) {
  return "${input == null ? "" : "${input}is not a valid Input. "}Please enter a positive Integer!";
}

bool isNullOrEmpty(String? input) {
  return (input == null || input.isEmpty);
}

bool isValidInput(String? input) {
  if (isNullOrEmpty(input)) {
    print(input);
    return false;
  } else {
    print(input);
    int? y = int.tryParse(input!);
    return (y != null);
  }
}
