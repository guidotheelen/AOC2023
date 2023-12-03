const idRegex = r'Game (\d+)';
const redRegex = r'(\d+) red';
const greenRegex = r'(\d+) green';
const blueRegex = r'(\d+) blue';

// Part 1
int validSum(
  List<String> input,
  int maxRed,
  int maxGreen,
  int maxBlue,
) {
  final validLines = input.where((line) {
    final red = _maxRed(line);
    final green = _maxGreen(line);
    final blue = _maxBlue(line);

    return red <= maxRed && green <= maxGreen && blue <= maxBlue;
  });

  return validLines.map(_parseId).reduce((a, b) => a + b);
}

int _maxRed(String line) => _maxColor(line, redRegex);

int _maxGreen(String line) => _maxColor(line, greenRegex);

int _maxBlue(String line) => _maxColor(line, blueRegex);

int _maxColor(String line, String regex) {
  final matches = RegExp(regex).allMatches(line);
  return matches
      .map((match) => int.parse(match.group(1) ?? '0'))
      .reduce((a, b) => a > b ? a : b);
}

int _parseId(String line) {
  final match = RegExp(idRegex).firstMatch(line);
  print(match?.group(0));
  return int.parse(match?.group(1) ?? '0');
}

// Part 2
int powerSum(List<String> input) {
  final linePowers = input.map(
    (line) {
      final red = _maxRed(line);
      final green = _maxGreen(line);
      final blue = _maxBlue(line);

      return red * green * blue;
    },
  );

  return linePowers.reduce((acc, e) => acc + e);
}
