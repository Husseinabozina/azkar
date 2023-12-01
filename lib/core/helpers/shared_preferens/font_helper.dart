import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static Uri kquranAppUrl = Uri.parse('http://google.come');
  static double kQuranFontSize = 40;
  static Future saveSetting() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("arabicFontSize", kQuranFontSize.toInt());
  }

  static Future getSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      kQuranFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
    } catch (_) {
      kQuranFontSize = 40;
    }
  }

  Future<void> saveBookMark(int surah, int ayah) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('surah', surah);
    await prefs.setInt('ayah', ayah);
  }

  getBookMark() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getInt('surah');
    prefs.getInt('ayah');
  }
}
