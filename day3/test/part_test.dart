import 'package:day3/part.dart';
import 'package:test/test.dart';

void main() {
  group(Part, () {
    test('is valid', () {
      final part = Part(
        number: 1,
        adjacentFields: ['.', '.', '#'],
        gearPositions: [],
      );

      expect(part.isValid, isTrue);
    });

    test('is invalid', () {
      final part = Part(
        number: 1,
        adjacentFields: ['.', '.', '.'],
        gearPositions: [],
      );

      expect(part.isValid, isFalse);
    });
  });
}
