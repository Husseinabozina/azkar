import 'package:azkary/Features/quran/data/models/surah/surah.dart';

abstract class QuranRepo {
  Future<List<Surah>> fetchAllSurahs();
  List<Map<String, String>> fetchSurahsNames();
  List<int> fetchSurahsVerses();
}
