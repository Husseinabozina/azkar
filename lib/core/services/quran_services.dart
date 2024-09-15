import 'dart:convert';

import 'package:azkary/core/cosntant.dart';
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

  Future<List<Map<String, dynamic>>> surahTafser(int surahId) async {
    final surahName = surahNames[surahId];
    if (surahName == null) {
      throw Exception('Surah not found');
    }
    final String response =
        await rootBundle.loadString('assets/json/$surahName.json');
    final data = (await json.decode(response)["result"] as List<dynamic>)
        .cast<Map<String, dynamic>>();
    return data;
  }

  Future<List<Map<String, dynamic>>> getSurahAudios(int surahId) {
    String apiUrl = 'https://api.alquran.cloud/v1/surah/$surahId/ar.alafasy';

    return dio.get(apiUrl).then((response) {
      final data = (response.data["data"]["ayahs"] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      return data;
    });
  }
}
