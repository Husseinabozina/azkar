part of 'quran_cubit.dart';

class QuranState {}

class QuranInitial extends QuranState {}

class QuranGetSuccess extends QuranState {
  final List<Surah> surahsList;
  QuranGetSuccess({required this.surahsList});
}

class QuranSaveBookMarkSuccess extends QuranState {}

class QuranGetBookMarkSuccess extends QuranState {}

class ToggleFabButtonState extends QuranState {}
