import 'package:azkary/Features/quran/data/repos/quran_repo.dart';
import 'package:azkary/Features/quran/data/repos/quran_repo_imple.dart';
import 'package:azkary/core/services/quran_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<QuranService>(QuranService());
  getIt.registerSingleton<QuranRepoImpl>(QuranRepoImpl(
    getIt.get<QuranService>(),
  ));
}
