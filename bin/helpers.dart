class Helpers {
  bool isPostiveIntegerString(String? input) {
    if (isNullOrEmpty(input)) {
      return false;
    } else {
      int? y = int.tryParse(input!);
      return (y != null && y > 0);
    }
  }

  bool isLetterOnlyString(String? testString) {
    RegExp regex = RegExp(r"^[a-zA-Z]+$");
    return isNullOrEmpty(testString) ? false : regex.hasMatch(testString!);
  }

  bool isNullOrEmpty(String? input) {
    return (input == null || input.isEmpty);
  }
}
