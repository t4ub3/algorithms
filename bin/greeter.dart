import 'dart:io';
import 'helpers.dart';

bool isValidInput = false;
String? input;

void main() {
  String firstName;
  String lastName;
  String age;
  String gender;

  do {
    print("Please tell me your first name:");
    input = stdin.readLineSync();
    isValidInput = !Helpers().isNullOrEmpty(input);
  } while (!isValidInput);
  firstName = input!;
  resetInput();

  do {
    print("Hi $firstName! What is your last name:");
    input = stdin.readLineSync();
    isValidInput = !Helpers().isNullOrEmpty(input);
  } while (!isValidInput);
  lastName = input!;
  resetInput();

  do {
    print("Would you mind sharing your age aswell?");
    input = stdin.readLineSync();
    int? ageTemp;
    if (!Helpers().isNullOrEmpty(input)) {
      ageTemp = int.tryParse(input!);
    }

    isValidInput = (ageTemp != null && (0 <= ageTemp && ageTemp <= 150));
  } while (!isValidInput);
  age = input!;
  resetInput();

  do {
    print("And finally please reveal your gender!");
    input = stdin.readLineSync();
    isValidInput = !Helpers().isNullOrEmpty(input);
  } while (!isValidInput);
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
      case < 18:
        greeting = "Good afternoon";
      default:
    }
    print("$greeting, $firstName $lastName");
  }
}

void resetInput() {
  input = null;
  isValidInput = false;
}
