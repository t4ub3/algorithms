import 'dart:io';

import 'helpers.dart';

const String welcome =
    "Please enter a alphanumerical sequence that starts with a letter!";
String? input;

void main(List<String> args) {
  // *--> validate Input
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
  final String compressedString = input!.toUpperCase();
  // *validate input <--

  final List<String> atoms = splitStringKeepNumbers(compressedString);
  print(atoms);
  List<String> uncompressedLetters = [];

  for (var i = 0; i < atoms.length; i++) {
    // add x amount the letter before
    if (Helpers().isNumber(atoms[i])) {
      int count = int.parse(atoms[i]);
      for (var j = 0; j < count - 1; j++) {
        uncompressedLetters.add(atoms[i - 1]);
      }
    } else {
      // add the letter itself
      uncompressedLetters.add(atoms[i]);
    }
  }
  String uncompressedString = uncompressedLetters.join("");
  print(uncompressedString);
}

List<String> splitStringKeepNumbers(String input) {
  final result = <String>[];
  int i = 0;

  while (i < input.length) {
    if (Helpers().isNumber(input[i])) {
      // digit: collect consecutive digits
      final start = i;
      while (i < input.length && Helpers().isNumber(input[i])) {
        i++;
      }
      result.add(input.substring(start, i));
    } else {
      // letter: add individually
      result.add(input[i]);
      i++;
    }
  }

  return result;
}

String hint(String? input) {
  return "${Helpers().isNullOrEmpty(input) ? "That" : "\"${input}\""} is not a valid Input. Please enter a sequence containing only A-Z, a-z and 0-9. It has to start with a letter!";
}
