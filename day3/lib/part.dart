class Part {
  const Part({
    required this.number,
    required this.adjacentFields,
    required this.gearPositions,
  });

  static const _symbolRegex = r'[^d.]';

  final int number;
  final List<String> adjacentFields;
  final List<(int, int)> gearPositions;

  bool get isValid => adjacentFields.any(
        (symbol) => RegExp(_symbolRegex).hasMatch(symbol),
      );

  bool get hasGear => gearPositions.isNotEmpty;
}
