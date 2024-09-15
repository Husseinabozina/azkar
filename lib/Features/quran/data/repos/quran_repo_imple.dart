import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/data/models/ayahAudio.dart';
import 'package:azkary/Features/quran/data/models/surah_tafseer.dart';
import 'package:azkary/Features/quran/data/repos/quran_repo.dart';
import 'package:azkary/core/network/api/error_handling/api_result.dart';
import 'package:azkary/core/network/api/error_handling/error_handler.dart';
import 'package:azkary/core/services/quran_services.dart';

class QuranRepoImpl implements QuranRepo {
  QuranService quranService;
  QuranRepoImpl(this.quranService);
  @override
  Future<List<Surah>> fetchAllSurahs() async {
    List<Map<String, dynamic>> surahsList = await quranService.readJson();
    List<Surah> allSurahs =
        surahsList.map((surah) => Surah.fromJson(surah)).toList();

    return allSurahs;
  }

  @override
  List<Map<String, String>> fetchSurahsNames() {
    throw UnimplementedError();
  }

  @override
  List<int> fetchSurahsVerses() {
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<List<SurahTafseer>>> getSurahsTafseer(int surahId) async {
    try {
      final data = await quranService.surahTafser(surahId);

      final surahTafseer = data.map((e) => SurahTafseer.fromJson(e)).toList();
      return ApiResult.success(surahTafseer);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<AyahAudio>>> getSurahAudios(int surahId) async {
    try {
      final data = await quranService.getSurahAudios(surahId);
      final surahAudios = data.map((e) => AyahAudio.fromJson(e)).toList();

      return ApiResult.success(surahAudios);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
