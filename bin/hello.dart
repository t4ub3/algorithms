void main(List<String> args) {
  if (args.isNotEmpty) {
    print('Hallo ${args.join(" ")}!');
  } else {
    print("Hallo!");
  }
}
