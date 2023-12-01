import 'package:day1/day1.dart';
import 'package:test/test.dart';

void main() {
  test('fist digit or number', () {
    expect(firstDigitPro('two1nine'), 2);
    expect(firstDigitPro('one2three'), 1);
    expect(firstDigitPro('eight2three'), 8);
    expect(firstDigitPro('abcone2threexyz'), 1);
    expect(firstDigitPro('xtwone3four'), 2);
    expect(firstDigitPro('4nineeightseven2'), 4);
    expect(firstDigitPro('zoneight234'), 1);
    expect(firstDigitPro('7pqrstsixteen'), 7);
  });

  test('last digit or number', () {
    expect(lastDigitPro('two1nine'), 9);
    expect(lastDigitPro('one2three'), 3);
    expect(lastDigitPro('eight2three'), 3);
    expect(lastDigitPro('abcone2threexyz'), 3);
    expect(lastDigitPro('xtwone3four'), 4);
    expect(lastDigitPro('4nineeightseven2'), 2);
    expect(lastDigitPro('zoneight234'), 4);
    expect(lastDigitPro('7pqrstsixteen'), 6);
  });
}
