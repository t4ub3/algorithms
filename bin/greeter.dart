import 'dart:io';

bool validInput = false;
String? input;

void main() {
  String firstName;
  String lastName;
  String age;
  String gender;

  do {
    print("Please tell me your first name:");
    input = stdin.readLineSync();
    validInput = !isNullOrEmpty(input);
  } while (!validInput);
  firstName = input!;
  resetInput();

  do {
    print("Hi $firstName! What is your last name:");
    input = stdin.readLineSync();
    validInput = !isNullOrEmpty(input);
  } while (!validInput);
  lastName = input!;
  resetInput();

  do {
    print("Would you mind sharing your age aswell?");
    input = stdin.readLineSync();
    int? ageTemp;
    if (!isNullOrEmpty(input)) {
      ageTemp = int.tryParse(input!);
    }

    validInput = (ageTemp != null && (0 <= ageTemp && ageTemp <= 150));
  } while (!validInput);
  age = input!;
  resetInput();

  do {
    print("And finally please reveal your gender!");
    input = stdin.readLineSync();
    validInput = (input != null && input!.isNotEmpty);
  } while (!validInput);
  gender = input!;
  resetInput();

  if (int.parse(age) < 40) {
    print("Hi, $firstName");
  } else {
    String greeting = "Good evening";
    final now = DateTime.now();
    final int hour = now.hour;
    switch (hour) {
      case < 13:
        greeting = "Good morning";
        break;
      case < 18:
        greeting = "Good afternoon";
        break;
      default:
    }
    print("$greeting, $firstName $lastName");
  }
}

void resetInput() {
  input = null;
  validInput = false;
}

bool isNullOrEmpty(String? input) {
  return (input == null || input.isEmpty);
}
