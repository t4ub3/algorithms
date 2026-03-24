import 'dart:io';

void main(List<String> args) {
  print("Please tell me your first name:");
  var firstName = stdin.readLineSync();
  print("Hi $firstName! What is your last name:");
  var lastName = stdin.readLineSync();
  print("Would you mind sharing your age aswell?");
  var age = int.tryParse(stdin.readLineSync()!);
  print("And finally please reveal your gender!");
  var gender = stdin.readLineSync();

  print('Good Morning $firstName $lastName');
}

void askUser(String question, bool condition, String hintText) {
  do {
    print(question);
    var usrInput = stdin.readLineSync();
    bool validation = validateInput(condition, hintText);
  } while (true);
}

bool validateInput(bool condition, String hintText) {
  if (!condition) {
    print(hintText);
    var newInput = stdin.readLineSync();
  }
  return true;
}
