import 'package:collection/collection.dart';

// Part 1
int firstDigit(String s) {
  var firstDigit = s.split('').firstWhere((e) => int.tryParse(e) != null);
  return int.parse(firstDigit);
}

int lastDigit(String s) {
  s = s.split('').reversed.join('');
  return firstDigit(s);
}

// Part 2
int firstDigitPro(String s) => _getDigit(s, 0, s.length - 1);

int lastDigitPro(String s) => _getDigit(s, s.length - 1, 0);

int _getDigit(String s, int start, int end) {
  String buffer = '';
  int step = start < end ? 1 : -1;
  for (int i = start; start < end ? i <= end : i >= end; i += step) {
    if (int.tryParse(s[i]) != null) {
      return int.parse(s[i]);
    }
    buffer = start < end ? buffer + s[i] : s[i] + buffer;
    String? spelledNumber = _spelledNumber(buffer);
    if (spelledNumber != null) {
      return _numbers[spelledNumber]!;
    }
  }
  return 0;
}

String? _spelledNumber(String s) =>
    _numbers.keys.firstWhereOrNull((n) => s.contains(n));

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
