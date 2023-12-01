import 'package:day1/day1.dart';
import 'package:test/test.dart';

void main() {
  test('fist digit or number', () {
    expect(firstDigitOrNumber('two1nine'), 2);
    expect(firstDigitOrNumber('one2three'), 1);
    expect(firstDigitOrNumber('eight2three'), 8);
    expect(firstDigitOrNumber('abcone2threexyz'), 1);
    expect(firstDigitOrNumber('xtwone3four'), 2);
    expect(firstDigitOrNumber('4nineeightseven2'), 4);
    expect(firstDigitOrNumber('zoneight234'), 1);
    expect(firstDigitOrNumber('7pqrstsixteen'), 7);
  });

  test('last digit or number', () {
    expect(lastDigitOrNumber('two1nine'), 9);
    expect(lastDigitOrNumber('one2three'), 3);
    expect(lastDigitOrNumber('eight2three'), 3);
    expect(lastDigitOrNumber('abcone2threexyz'), 3);
    expect(lastDigitOrNumber('xtwone3four'), 4);
    expect(lastDigitOrNumber('4nineeightseven2'), 2);
    expect(lastDigitOrNumber('zoneight234'), 4);
    expect(lastDigitOrNumber('7pqrstsixteen'), 6);
  });
}
