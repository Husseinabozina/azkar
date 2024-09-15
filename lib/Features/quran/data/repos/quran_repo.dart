import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/data/models/ayahAudio.dart';
import 'package:azkary/Features/quran/data/models/surah_tafseer.dart';
import 'package:azkary/core/network/api/error_handling/api_result.dart';

abstract class QuranRepo {
  Future<List<Surah>> fetchAllSurahs();
  List<Map<String, String>> fetchSurahsNames();
  List<int> fetchSurahsVerses();
  Future<ApiResult<List<SurahTafseer>>> getSurahsTafseer(int surahId);
  Future<ApiResult<List<AyahAudio>>> getSurahAudios(int surahId);
}
