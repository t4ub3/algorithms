class Helpers {
  bool isPostiveIntegerString(String? input) {
    if (isNullOrEmpty(input)) {
      return false;
    } else {
      int? y = int.tryParse(input!);
      return (y != null && y > 0);
    }
  }

  bool isNullOrEmpty(String? input) {
    return (input == null || input.isEmpty);
  }
}
