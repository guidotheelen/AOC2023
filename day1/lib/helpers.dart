int lineSum(
  List<String> input,
  int Function(String) firstDigit,
  int Function(String) lastDigit,
) =>
    input.fold(
      0,
      (acc, e) => acc + int.parse('${firstDigit(e)}${lastDigit(e)}'),
    );
