import 'dart:io';

import 'package:azkary/core/cosntant.dart';

void main() {
  final directory = Directory('assets/json');

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  surahNames.forEach((surahId, surahName) {
    final file = File('${directory.path}/$surahName.json');
    if (!file.existsSync()) {
      file.createSync();
      file.writeAsStringSync('{}'); // Write empty JSON
    }
  });

  print('Files created successfully!');
}
