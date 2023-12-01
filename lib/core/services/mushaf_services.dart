import 'dart:convert';

import 'package:flutter/services.dart';

class MushafServices {
  Future<List<Map<String, dynamic>>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/QuranJson.json');
    final data = (await json.decode(response) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    List<Map<String, dynamic>> items = [];
    items = data;
    return items;
  }

  // Future<List<Map<String, String>>> get surahsList async {
  //   List<Map<String, dynamic>> data = await readJson();
  //   List<Map<String, String>> surahs = (data
  //           .map((surah) => {
  //                 'surah': surah['id'].toString() as String,
  //                 'name': surah['name'] as String
  //               })
  //           .toList())
  //       .cast<Map<String, String>>();
  //   return surahs;
  // }

  // Future<List<int>> get nomberOfVerses async {
  //   List<Map<String, dynamic>> data = await readJson();
  //   List<int> surahsVersesList =
  //       data.map((surah) => surah['total_verses'] as int).toList();
  //   return surahsVersesList;
  // }
}
