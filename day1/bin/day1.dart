import 'package:day1/day1.dart';

void main(List<String> arguments) {
  final input = readInput();
  final parsedInput = parseInput(input);

  // Part 1
  final sum = parsedInput.fold(
    0,
    (acc, e) =>
        acc +
        toNumber(
          [
            firstDigit(e),
            lastDigit(e),
          ],
        ),
  );

  print('Part 1: $sum');

  // Part 2

  final sum2 = parsedInput.fold(
    0,
    (acc, e) =>
        acc +
        toNumber(
          [
            firstDigitOrNumber(e),
            lastDigitOrNumber(e),
          ],
        ),
  );

  print('Part 2: $sum2');
}
