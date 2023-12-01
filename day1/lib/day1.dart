import 'dart:io';

import 'package:path/path.dart' as p;

// Input

String readInput() {
  var filePath = p.join(Directory.current.path, '.', 'input.txt');
  return File(filePath).readAsStringSync();
}

List<String> parseInput(String input) => input.split('\n').toList();

// Part 1

int firstDigit(String s) {
  var firstDigit = s.split('').firstWhere((e) => int.tryParse(e) != null);
  return int.parse(firstDigit);
}

int lastDigit(String s) {
  var lastDigit = s.split('').lastWhere((e) => int.tryParse(e) != null);
  return int.parse(lastDigit);
}

// Part 2

Map<String, int> numbers = {
  'one': 1,
  'two': 2,
  'three': 3,
  'four': 4,
  'five': 5,
  'six': 6,
  'seven': 7,
  'eight': 8,
  'nine': 9,
  'zero': 0,
};

int firstDigitOrNumber(String s) {
  String buffer = '';
  for (int i = 0; i < s.length; i++) {
    if (int.tryParse(s[i]) != null) {
      return int.parse(s[i]);
    }
    buffer += s[i];
    if (_containsSpelledNumber(buffer)) {
      return _spelledNumber(buffer);
    }
  }
  return 0;
}

int lastDigitOrNumber(String s) {
  String buffer = '';
  for (int i = s.length - 1; i >= 0; i--) {
    if (int.tryParse(s[i]) != null) {
      return int.parse(s[i]);
    }
    buffer = s[i] + buffer;
    if (_containsSpelledNumber(buffer)) {
      return _spelledNumber(buffer);
    }
  }
  return 0;
}

bool _containsSpelledNumber(String s) {
  for (var number in numbers.keys) {
    if (s.contains(number)) {
      return true;
    }
  }
  return false;
}

int _spelledNumber(String s) {
  for (var number in numbers.keys) {
    if (s.contains(number)) {
      return numbers[number]!;
    }
  }
  return 0;
}

// int lastDigitOrNumber(String s) {
//   String buffer = '';
//   for (int i = s.length - 1; i >= 0; i--) {
//     if (int.tryParse(s[i]) != null) {
//       return int.parse(s[i]);
//     }
//     buffer = s[i] + buffer;
//     if (numbers.containsKey(buffer)) {
//       return numbers[buffer]!;
//     }
//   }
//   return 0;
// }

// Helpers

int toNumber(List<int> digits) => digits.fold(0, (acc, e) => acc * 10 + e);
