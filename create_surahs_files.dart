import 'dart:convert';
import 'dart:io';
import 'package:azkary/core/cosntant.dart';
import 'package:dio/dio.dart';

// قائمة بأسماء السور باللغة الإنجليزية

Future<void> fetchAndSaveSurahTafseer(int surahId) async {
  final dio = Dio();
  final url =
      "https://quranenc.com/api/v1/translation/sura/arabic_moyassar/$surahId";

  try {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;

      // الحصول على اسم السورة باللغة الإنجليزية
      final surahName = surahNames[surahId] ?? 'unknown_surah';

      // تحديد مسار حفظ الملفات
      final directory = Directory('assets/json');
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }

      final filePath = '${directory.path}/$surahName.json';
      final file = File(filePath);

      // حفظ البيانات في ملف JSON
      await file.writeAsString(json.encode(data));
      print('Data for Surah $surahId saved to $filePath');
    } else {
      print('Failed to load data for Surah $surahId: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching data for Surah $surahId: $error');
  }
}

Future<void> fetchAllSurahsTafseer() async {
  for (int surahId = 1; surahId <= 114; surahId++) {
    await fetchAndSaveSurahTafseer(surahId);
  }
}

void main() {
  fetchAllSurahsTafseer();
}
