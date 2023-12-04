import 'package:day4/card.dart';
import 'package:test/test.dart';

void main() {
  group(Card, () {
    test('score', () {
      final card = Card(
        id: 1,
        numbers: [1, 2, 3, 4, 5],
        winningNumbers: [1, 2, 3, 4, 5],
      );

      expect(card.score, 16);
    });
  });
}
