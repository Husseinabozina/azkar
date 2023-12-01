import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/data/repos/quran_repo.dart';
import 'package:azkary/core/helpers/shared_preferens/font_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.quranRepo) : super(QuranInitial());

  QuranRepo quranRepo;
  late var listSurahs;
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

  Future<List<Surah>> fethAllSurahs() async {
    var result = await quranRepo.fetchAllSurahs();
    listSurahs = result;

    emit(QuranGetSuccess(surahsList: result));
    return result;
  }

  Future<void> saveBookMark(surah, ayah) async {
    await PrefHelper().saveBookMark(surah, ayah).then((value) {
      emit(QuranSaveBookMarkSuccess());

      print('saved surah is $surah saved ayah is $ayah');
    });
  }

  Future<void> getBookMark() async {
    final prefs = await SharedPreferences.getInstance();
    surahIndex = await prefs.getInt('surah') ?? 0;
    ayahindex = await prefs.getInt('ayah') ?? 0;
    print('Geted surah is $surahIndex Geted ayah is $ayahindex');
    emit(QuranGetBookMarkSuccess());
  }
}
