import 'package:day3/day3.dart';
import 'package:test/test.dart';

void main() {
  group('screenParts', () {
    test('returns parts with correct number', () {
      final input = [
        '467..114..',
        '...*......',
        '..35..633.',
        '......#...',
      ];

      final parts = getParts(input);

      expect(parts, hasLength(4));
      expect(parts[0].number, 467);
      expect(parts[1].number, 114);
      expect(parts[2].number, 35);
      expect(parts[3].number, 633);
    });

    test('returns parts with correct adjacent fields', () {
      final input = [
        '467..114..',
        '...*......',
        '..35..633.',
        '......#...',
      ];

      final parts = getParts(input);

      expect(parts[0].adjacentFields, containsAll(['.', '.', '.', '.', '*']));
      expect(parts[1].adjacentFields, containsAll(['.', '.', '.', '.', '.']));
      expect(parts[2].adjacentFields,
          containsAll(['.', '.', '.', '.', '.', '.', '.', '.', '.', '*']));
    });

    test('returns parts with correct gear positions', () {
      final input = [
        '467..114..',
        '...*......',
        '..35..633*',
        '......*...',
      ];

      final parts = getParts(input);

      expect(parts[0].gearPositions, containsAll([(1, 3)]));
      expect(parts[1].gearPositions, isEmpty);
      expect(parts[2].gearPositions, containsAll([(1, 3)]));
      expect(parts[3].gearPositions, containsAll([(2, 9), (3, 6)]));
    });
  });
}
