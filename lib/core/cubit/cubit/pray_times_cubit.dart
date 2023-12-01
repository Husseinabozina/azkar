import 'package:azkary/Features/Tasbeah/data/pray.dart';
import 'package:azkary/core/services/prayertime_service.dart';

import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'pray_times_state.dart';

class PrayTimesCubit extends Cubit<PrayTimesState> {
  PrayTimesCubit(this.prayerTimeService) : super(PrayTimesInitial());
  PrayerTimeService prayerTimeService;
  void fetchPrayTimes() async {
    emit(PrayTimesInitial());
    late final lat;
    late final long;
    try {
      await prayerTimeService.getCurrentLocation().then((value) {
        lat = "${value.latitude}";
        long = "${value.longitude}";
        print(
            '$lat lattttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
      });

      final praysTimes = await prayerTimeService
          .fetchPrayerTime(lat: lat, long: long)
          .then((value) {
        print("${value[0].name}");
        emit(PrayTimesSuccess(prayList: value));
      });
    } catch (e) {
      emit(PrayTimesFailure());
      print(e);
    }
  }
}
