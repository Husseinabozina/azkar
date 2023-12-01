import 'dart:convert';

import 'package:flutter/services.dart';

class QuranService {
  Future<List<Map<String, dynamic>>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Quran.json');
    final data = (await json.decode(response) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    List<Map<String, dynamic>> items = [];
    return data;
  }
}
