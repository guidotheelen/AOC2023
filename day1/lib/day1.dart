import 'package:collection/collection.dart';

import 'package:day1/extensions.dart';

// Part 1
int firstDigit(String s) =>
    int.parse(s.split('').firstWhere((e) => int.tryParse(e) != null));

int lastDigit(String s) => firstDigit(s.split('').reversed.join(''));

// Part 2
int firstDigitPro(String s) => _getDigit(s);

int lastDigitPro(String s) => _getDigit(s, true);

int _getDigit(String s, [bool reversed = false]) {
  s = reversed ? s.reverse : s;

  if (_getSpelled(s) == null) return firstDigit(s);

  final buffer = StringBuffer();
  for (String e in s.split('')) {
    if (int.tryParse(e) != null) {
      return int.parse(e);
    } else {
      buffer.write(e);
    }

    final s = _getSpelled(buffer.toString());
    if (s != null) return _numbers[s]!;
  }

  return -1;
}

String? _getSpelled(String s) => _numbers.keys
    .firstWhereOrNull((n) => s.contains(n) || s.contains(n.reverse));

Map<String, int> _numbers = {
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
