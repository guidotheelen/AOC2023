import 'dart:math';

class Card {
  Card({
    required this.id,
    required this.numbers,
    required this.winningNumbers,
  });

  final int id;
  final List<int> numbers;
  final List<int> winningNumbers;

  int get winningAmount =>
      numbers.where((number) => winningNumbers.contains(number)).length;

  int get score => pow(2, winningAmount - 1).toInt();
}
