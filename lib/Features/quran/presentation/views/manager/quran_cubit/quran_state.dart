part of 'quran_cubit.dart';

class QuranState {}

class QuranInitial extends QuranState {}

class QuranGetFailure extends QuranState {}

class QuranGetSuccess extends QuranState {
  final List<Surah> surahsList;
  QuranGetSuccess({required this.surahsList});
}

class QuranSaveBookMarkSuccess extends QuranState {}

class QuranGetBookMarkSuccess extends QuranState {}

class ToggleFabButtonState extends QuranState {}

class QuranGetSurahTafseerSuccess extends QuranState {}

class QuranGetSurahTafseerLoading extends QuranState {}

class QuranGetSurahTafseerFailure extends QuranState {
  final String? msg;
  QuranGetSurahTafseerFailure({this.msg});
}
