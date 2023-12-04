import 'package:file_parser/file_parser.dart';

import 'package:day3/day3.dart';

void main(List<String> arguments) async {
  final input = await parseFile('input.txt');

  // Part 1
  final allParts = getParts(input);
  final validParts = allParts.where((part) => part.isValid);
  final sum = validParts.fold<int>(0, (sum, part) => sum + part.number);

  print('Part 1: $sum');

  // Part 2
  final parts = getParts(input);
  final powers = multiplyDuoGears(parts);
  final powerSum = powers.fold(0, (sum, power) => sum + power) ~/ 2;

  print(powerSum);
}
