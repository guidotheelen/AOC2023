import 'package:collection/collection.dart';
import 'package:day4/day4.dart';
import 'package:file_parser/file_parser.dart';

void main(List<String> arguments) async {
  final input = await parseFile('input.txt');

  // Part 1
  final cards = parseCards(input);
  final sum = cards.fold<int>(0, (sum, card) => sum + card.score);

  print('Part 1: $sum');

  // Part 2
  var cards2 = parseCards(input);

  final game = <int, int>{
    for (final card in cards2) card.id: 1,
  };

  for (final card in cards2) {
    final matches = card.winningAmount;
    for (var i = 1; i <= matches && i <= cards2.length; i++) {
      game[card.id + i] = game[card.id + i]! + game[card.id]!;
    }
  }

  print('Part 2: ${game.values.sum}');
}
