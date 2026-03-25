import 'dart:io';
import 'helpers.dart';

int userInt = 0;
void main() {
  print("Hi! Please enter a positive integer!");

  // validate input -->
  var input = stdin.readLineSync();
  while (!Helpers().isPostiveIntegerString(input)) {
    print(hint(input));
    input = stdin.readLineSync();
  }
  userInt = int.parse(input!);
  // <-- validate input

  print(calcPrimes1());
  print(calcPrimes2());
  print(calcPrimes3());
}

int countDividers(int number) {
  int count = 0;
  for (var i = 1; i < number + 1; i++) {
    if (number % i == 0) {
      count++;
    }
  }
  return count;
}

int countDividersWithBreak(int number) {
  int count = 0;
  for (var i = 1; i < number + 1; i++) {
    if (number % i == 0) {
      count++;
      if (count > 2) {
        break;
      }
    }
  }
  return count;
}

int countDividers3(int number) {
  int count = 0;
  int half = (number / 2).floor();
  for (var i = 1; i < half; i++) {
    if (number % i == 0) {
      count++;
      if (count > 2) {
        break;
      }
    }
  }
  print("$half, $count");
  return count;
}

String calcPrimes1() {
  List<int> primes1 = [];
  final stopwatch1 = Stopwatch()..start();
  // start at 2 because 1 is no prime
  for (var i = 2; i < userInt + 1; i++) {
    if (countDividers(i) == 2) {
      primes1.add(i);
    }
  }
  stopwatch1.stop();
  return formatResult("Count dividers (my slow solution)", primes1, stopwatch1);
}

String calcPrimes2() {
  List<int> primes2 = [];

  final stopwatch2 = Stopwatch()..start();
  for (var i = 2; i < userInt + 1; i++) {
    if (countDividersWithBreak(i) == 2) {
      primes2.add(i);
    }
  }
  stopwatch2.stop();
  return formatResult(
    "Count dividers with break (my fast solution)",
    primes2,
    stopwatch2,
  );
}

String calcPrimes3() {
  List<int> primes3 = [];
  final stopwatch3 = Stopwatch()..start();
  primes3 = primesUpTo(userInt);

  stopwatch3.stop();
  return formatResult(
    "Sieve of Eratosthenes (ai solution)",
    primes3,
    stopwatch3,
  );
}

String formatResult(String name, List<int> primes, Stopwatch stopwatch) {
  return "_______________________________\n${name.toUpperCase()}\n- Number of Primes: ${primes.length}\n- Compution time (ms): ${stopwatch.elapsedMilliseconds}";
}

String hint(String? input) {
  return "${Helpers().isNullOrEmpty(input) ? "That" : "\"${input}\""} is not a valid Input. Please enter a positive Integer!";
}

List<int> primesUpTo(int n) {
  if (n < 2) return [];

  final sieve = List<bool>.filled(n + 1, true);
  sieve[0] = false;
  sieve[1] = false;

  for (int i = 2; i * i <= n; i++) {
    if (sieve[i]) {
      for (int j = i * i; j <= n; j += i) {
        sieve[j] = false;
      }
    }
  }

  return [
    for (int i = 2; i <= n; i++)
      if (sieve[i]) i,
  ];
}
