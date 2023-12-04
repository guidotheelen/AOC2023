import 'package:day4/card.dart';

final idRegex = RegExp(r'Card\s+(\d+)');
final numbersRegex = RegExp(r':\s+([\d+\s+]+)\s+\|');
final winningNumbersRegex = RegExp(r'\|\s+([\d+\s+]+)');

// Card   1: 17 15  5 75 36 13 16 66 92 39 | 13 92 16  5 87 78 15 94
List<Card> parseCards(List<String> input) {
  final cards = <Card>[];

  for (final line in input) {
    final id = line.fromRegex(idRegex);
    final numbers = line.fromRegexToList(numbersRegex);
    final winningNumbers = line.fromRegexToList(winningNumbersRegex);

    cards.add(
      Card(
        id: id,
        numbers: numbers,
        winningNumbers: winningNumbers,
      ),
    );
  }

  return cards;
}

List<int> cardsToCopy(Card card) => List.generate(
      card.winningAmount,
      (index) => card.id,
    );

extension on String {
  int fromRegex(RegExp regex) => int.parse(
        regex.firstMatch(this)?.group(1) ?? '-1',
      );

  List<int> fromRegexToList(RegExp regex) =>
      regex
          .firstMatch(this)
          ?.group(1)
          ?.split(' ')
          .map((e) => e.trim())
          .where((number) => number.isNotEmpty)
          .map((number) => int.parse(number))
          .toList() ??
      [];
}
