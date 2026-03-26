import 'dart:io';

import 'helpers.dart';

const String welcome =
    "Please enter a alphanumerical sequence that starts with a letter!";
String? input;

void main(List<String> args) {
  // --> validate Input
  if (args.isEmpty) {
    print(welcome);
    input = stdin.readLineSync();
  } else {
    input = args[0];
  }
  while (!Helpers().isAlphanumericalAndStartsWithLetter(input)) {
    print(hint(input));
    input = stdin.readLineSync();
  }
  final String uncompressedString = input!.toUpperCase();
  // validate input <--

  print(uncompressedString);
  final List<String> letters = uncompressedString.split("");
  List<String> compressedLetters = [];

  for (var i = 0; i < letters.length; i++) {
    if (Helpers().isNumber(letters[i])) {}
  }
}

String hint(String? input) {
  return "${Helpers().isNullOrEmpty(input) ? "That" : "\"${input}\""} is not a valid Input. Please enter a sequence containing only A-Z, a-z and 0-9. It has to start with a letter!";
}
