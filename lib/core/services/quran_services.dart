import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class QuranService {
  final dio = Dio();
  Future<List<Map<String, dynamic>>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Quran.json');
    final data = (await json.decode(response) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    List<Map<String, dynamic>> items = [];
    return data;
  }

 Future<Response<dynamic>> surahTafser(int surahId) async {
    String url =
        "https://quranenc.com/api/v1/translation/sura/arabic_moyassar/$surahId";
    return dio.get(
      url,
    );
    
  }
}
