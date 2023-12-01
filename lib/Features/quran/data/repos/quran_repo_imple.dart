import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/data/repos/quran_repo.dart';
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
// List<Map<String, dynamic>> surahsList = await quranService.readJson();
//  List<Map<String,String>> surahIdList=surahsList.map((e) => null)
    throw UnimplementedError();
  }

  @override
  List<int> fetchSurahsVerses() {
    // TODO: implement fetchSurahsVerses
    throw UnimplementedError();
  }
}
