import 'dart:io';

import 'helpers.dart';

const String welcome = "Please enter a sequence of letters only!";
String? input;

void main(List<String> args) {
  // --> validate Input
  if (args.isEmpty) {
    print(welcome);
    input = stdin.readLineSync();
  } else {
    input = args[0];
  }
  while (!Helpers().isLetterOnly(input)) {
    print(hint(input));
    input = stdin.readLineSync();
  }
  final String uncompressedString = input!.toUpperCase();
  // validate input <--

  final List<String> letters = uncompressedString.split("");
  List<String> compressedLetters = [];

  // skip last two elements, they wont start a sequence of 3 equal letters
  for (var i = 0; i < letters.length; i++) {
    int countMatches = 0;
    // check following letters
    for (var j = i; j < letters.length; j++) {
      if (letters[i] == letters[j]) {
        countMatches++;
      } else {
        break;
      }
    }
    // shorten sequences and skip to element after the sequence
    compressedLetters.add(letters[i]);
    if (countMatches > 2) {
      compressedLetters.add(countMatches.toString());
      i = i + countMatches - 1;
    }
  }

  final compressedString = compressedLetters.join("");
  print(compressedString);
}

String hint(String? input) {
  return "${Helpers().isNullOrEmpty(input) ? "That" : "\"${input}\""} is not a valid Input. Please enter a sequence containing only A-Z and a-z!";
}
