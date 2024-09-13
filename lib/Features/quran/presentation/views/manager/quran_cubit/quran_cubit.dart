import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/data/models/surah_tafseer.dart';
import 'package:azkary/Features/quran/data/repos/quran_repo.dart';
import 'package:azkary/core/services/cach_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.quranRepo) : super(QuranInitial());

  QuranRepo quranRepo;
  List<Surah>? surahList;
  List<SurahTafseer>? surahTafseer;
  bool fabIsClicked = false;
  int surahIndex = 0;
  int ayahindex = 0;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  fabToTrue() {
    fabIsClicked = true;
    emit(ToggleFabButtonState());
  }

  fabToFalse() {
    fabIsClicked = false;
    emit(ToggleFabButtonState());
  }

  Future<void> fethAllSurahs() async {
    emit(QuranInitial());
    try {
      await quranRepo.fetchAllSurahs().then((value) {
        try {
          surahList = value;
          emit(QuranGetSuccess(surahsList: value));
        } catch (e) {
          emit(QuranGetFailure());
        }
      });
    } catch (e) {
      emit(QuranGetFailure());
    }
  }

  void getSurahTafseer(int surahId) async {
    emit(QuranGetSurahTafseerLoading());
    final result = await quranRepo.getSurahsTafseer(surahId);
    result.when(success: (value) {
      surahTafseer = value;
      emit(QuranGetSurahTafseerSuccess());
    }, failure: (error) {
      emit(QuranGetSurahTafseerFailure(msg: error.toString()));
    });
  }

  Future<void> saveBookMark(surah, ayah) async {
    await CacheHelper.save(key: 'surah', value: surah - 1);
    await CacheHelper.save(key: 'ayah', value: ayah).then((value) {
      emit(QuranSaveBookMarkSuccess());
    });
  }

  Future<void> getBookMark() async {
    surahIndex = CacheHelper.get(key: 'surah') ?? 0;
    ayahindex = CacheHelper.get(key: 'ayah') ?? 0;
    emit(QuranGetBookMarkSuccess());
  }
}
