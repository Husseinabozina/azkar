import 'package:azkary/core/services/cach_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static Uri kquranAppUrl = Uri.parse('http://google.come');
  static double kQuranFontSize = 40;
  static Future saveSetting() async {
    await CacheHelper.save(
        key: "arabicFontSize", value: kQuranFontSize.toInt());
  }

  static Future getSettings() async {
    try {
      kQuranFontSize = await CacheHelper.get(key: 'arabicFontSize')!.toDouble();
    } catch (_) {
      kQuranFontSize = 40;
    }
  }

  static Future<void> saveBookMark(int surah, int ayah) async {
    await CacheHelper.save(key: 'surah', value: surah);
    await CacheHelper.save(key: 'ayah', value: ayah);
  }

  static getBookMark() async {
    CacheHelper.get(key: 'surah');
    CacheHelper.get(key: 'ayah');
  }
}
