import 'package:day1/day1.dart';

void main(List<String> arguments) {
  final input = parseInput(readInput());

  // Part 1
  final part1 = lineSum(input, firstDigit, lastDigit);
  print('Part 1: $part1');

  // Part 2
  final part2 = lineSum(input, firstDigitPro, lastDigitPro);
  print('Part 2: $part2');
}
