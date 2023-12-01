import 'dart:io';

Future<List<String>> parseFile(String filePath) async {
  final file = File(filePath);
  final lines = await file.readAsLines();

  return lines;
}
