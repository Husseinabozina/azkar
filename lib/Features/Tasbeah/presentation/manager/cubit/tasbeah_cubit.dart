import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tasbeah_state.dart';

class TasbeahCubit extends Cubit<TasbeahState> {
  TasbeahCubit() : super(TasbeahInitial());
  String selectedZedr = 'سبحان الله';
  String zekr1 = 'سبحان الله';
  String zekr2 = 'الحمد لله';
// String zekr2 = 'الحمد لله';
// String zekr2 = 'الحمد لله';
// String zekr2 = 'الحمد لله';

  int tasbeahCounter = 0;

  void selectZekr(String zekr) {
    selectedZedr = zekr;
    emit(SelectZekrSuccess());
  }

  void changeCounter() {
    tasbeahCounter++;
    emit(IncrementCounterSuccess());
  }
}
