import 'package:day3/part.dart';

final _digitMatcher = RegExp(r'\d+');
final _gearMatcher = RegExp(r'[*]');

/// Parses the input into a list of [Part]s.
List<Part> getParts(List<String> input) {
  final parts = <Part>[];

  for (var i = 0; i < input.length; i++) {
    final line = input[i];

    _digitMatcher.allMatches(line).forEach((match) {
      final number = int.parse(match.group(0) ?? '-1');
      final adjacentFields = <String>[];
      final gearPositions = <(int, int)>[];

      // Add the field to the left
      if (match.start > 0) {
        final pos = match.start - 1;
        if (_gearMatcher.hasMatch(line[pos])) {
          gearPositions.add((i, pos));
        }
        adjacentFields.add(line[pos]);
      }

      // Add the field to the right
      if (match.end < line.length) {
        final pos = match.end;
        if (_gearMatcher.hasMatch(line[pos])) {
          gearPositions.add((i, pos));
        }
        adjacentFields.add(line[pos]);
      }

      // Add fields directly and diagonally above number
      if (i > 0) {
        final previousLine = input[i - 1];

        if (match.start > 0) {
          final pos = match.start - 1;
          if (_gearMatcher.hasMatch(previousLine[pos])) {
            gearPositions.add((i - 1, pos));
          }
          adjacentFields.add(previousLine[pos]);
        }

        final topFields =
            previousLine.substring(match.start, match.end).split('');
        adjacentFields.addAll(topFields);
        for (var j = 0; j < topFields.length; j++) {
          final pos = match.start + j;
          if (_gearMatcher.hasMatch(topFields[j])) {
            gearPositions.add((i - 1, pos));
          }
        }

        if (match.end < line.length) {
          final pos = match.end;
          if (_gearMatcher.hasMatch(previousLine[pos])) {
            gearPositions.add((i - 1, pos));
          }
          adjacentFields.add(previousLine[pos]);
        }
      }

      // Add fields directly and diagonally below number
      if (i < input.length - 1) {
        final nextLine = input[i + 1];

        if (match.start > 0) {
          final pos = match.start - 1;
          if (_gearMatcher.hasMatch(nextLine[pos])) {
            gearPositions.add((i + 1, pos));
          }
          adjacentFields.add(nextLine[pos]);
        }

        final bottomFields =
            nextLine.substring(match.start, match.end).split('');
        adjacentFields.addAll(bottomFields);
        for (var j = 0; j < bottomFields.length; j++) {
          final pos = match.start + j;
          if (_gearMatcher.hasMatch(bottomFields[j])) {
            gearPositions.add((i + 1, pos));
          }
        }

        if (match.end < line.length) {
          final pos = match.end;
          if (_gearMatcher.hasMatch(nextLine[pos])) {
            gearPositions.add((i + 1, pos));
          }
          adjacentFields.add(nextLine[match.end]);
        }
      }

      parts.add(Part(
        number: number,
        adjacentFields: adjacentFields,
        gearPositions: gearPositions,
      ));
    });
  }

  return parts;
}

// Part 2
List<int> multiplyDuoGears(List<Part> parts) {
  final multiplications = <int>[];

  // filter out non gear parts
  parts = parts..where((part) => part.hasGear);

  // Find parts that only share a gear with one other part
  // and multiply their numbers
  for (var i = 0; i < parts.length; i++) {
    final part = parts[i];
    final otherParts = parts.where((otherPart) => otherPart != part);

    final sharedGears = part.gearPositions
        .where((gear) => otherParts.any((otherPart) =>
            otherPart.gearPositions.contains(gear) &&
            otherPart.gearPositions.length == 1))
        .toList();

    if (sharedGears.length == 1) {
      final otherPart = otherParts.firstWhere(
          (otherPart) => otherPart.gearPositions.contains(sharedGears[0]));

      multiplications.add(part.number * otherPart.number);
    }
  }

  return multiplications;
}
