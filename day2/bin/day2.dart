import 'package:file_parser/file_parser.dart';

import 'package:day2/day2.dart';

void main(List<String> arguments) async {
  const red = 12;
  const green = 13;
  const blue = 14;

  final input = await parseFile('input.txt');

  // Part 1
  final sum = validSum(input, red, green, blue);
  print('Part 1: $sum');

  // Part 2
  final power = powerSum(input);
  print('Part 2: $power');
}
