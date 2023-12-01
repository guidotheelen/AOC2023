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
    if (_containsSpelledNumber(buffer)) {
      return _getSpelledNumber(buffer);
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

int _getSpelledNumber(String s) {
  for (var number in numbers.keys) {
    if (s.contains(number)) {
      return numbers[number]!;
    }
  }
  return 0;
}

// Helpers
int lineSum(
  List<String> input,
  int Function(String) first,
  int Function(String) last,
) =>
    input.fold(
      0,
      (acc, e) =>
          acc +
          int.parse(
            '${first(e)}'
            '${last(e)}',
          ),
    );
