int lineSum(
  List<String> input,
  int Function(String) first,
  int Function(String) last,
) =>
    input.fold(
      0,
      (acc, e) =>
          acc +
          int.parse(
            '${first(e)}'
            '${last(e)}',
          ),
    );
