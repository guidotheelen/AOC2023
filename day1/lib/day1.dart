import 'dart:io';

import 'package:path/path.dart' as p;

String readInput() {
  var filePath = p.join(Directory.current.path, '.', 'input.txt');
  return File(filePath).readAsStringSync();
}

int calculate() {
  return 6 * 7;
}
