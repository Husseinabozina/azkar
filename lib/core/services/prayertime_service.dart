import 'package:geolocator/geolocator.dart';
import 'package:azkary/Features/Tasbeah/data/pray.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class PrayerTimeService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location are permanently denied, we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }

  Dio dio = Dio();
  Future<List<Pray>> fetchPrayerTime({required String lat, long}) async {
    final dateNow = DateTime.now();
    final date = DateFormat('dd-MM-yyyy').format(dateNow);

    String url =
        'https://api.aladhan.com/v1/calendar/${dateNow.year}/${dateNow.month}?latitude=$lat&longitude=$long&method=2';

    final result = await dio.get(url);

    List<Map<String, dynamic>> data =
        ((result.data)['data'] as List<dynamic>).cast<Map<String, dynamic>>();
    Map<String, dynamic> days = data.firstWhere(
      (element) {
        return element["date"]['gregorian']['date'] == date;
      },
    );
    final prayTimes = days['timings'];

    // the problem is here

    List<Pray> salahsLists = [
      Pray.fajrFromJson(prayTimes),
      Pray.shrouqFromJson(prayTimes),
      Pray.dhuhrFromJson(prayTimes),
      Pray.asrFromJson(prayTimes),
      Pray.maghribFromJson(prayTimes),
      Pray.ishaFromJson(prayTimes),
    ];

    return salahsLists;
  }
}
