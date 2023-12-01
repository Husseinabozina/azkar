import 'dart:convert';

import 'package:azkary/data/all_azkar.dart';
import 'package:flutter/services.dart';

Future<List<List<dynamic>>> testMashroa() async {
  String jsonassets = 'assets/azkar.json';
  final String response = await rootBundle.loadString(jsonassets);
  var data = jsonDecode(response);
  var azkar = (data['rows']! as List<dynamic>).cast<List<dynamic>>();

  return azkar;
}

List<String> azkarCategories(List<List<dynamic>> azkar) {
  List<dynamic> allazkarCategories = [];
  // String firstcate = (azkar[0][0] as String);
  // allazkarCategories.add(firstcate);
  // azkar.where((e) => e[0] != firstcate).forEach((element) {
  //   allazkarCategories.add(element[0]);
  // });
  for (int i = 0; i < azkar.length; i++) {
    if (!allazkarCategories.contains(azkar[i][0])) {
      allazkarCategories.add(azkar[i][0]);
    }
  }

  print(allazkarCategories.length);
  print(azkarDataList.length);
  return allazkarCategories.cast<String>();
}
