part of 'pray_times_cubit.dart';

class PrayTimesState {}

class PrayTimesInitial extends PrayTimesState {}

class PrayTimesSuccess extends PrayTimesState {
  List<Pray>? prayList;
  PrayTimesSuccess({this.prayList});
}

class PrayTimesFailure extends PrayTimesState {}
