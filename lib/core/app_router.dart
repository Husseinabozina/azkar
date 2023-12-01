import 'package:azkary/Features/Azkar/presentation/view/Azkar_detailed_view/azkar_Details_view.dart';
import 'package:azkary/Features/Azkar/presentation/view/Azar_view.dart/azkar_view.dart';
import 'package:azkary/Features/Azkar/presentation/view/doaas/doaas_detailed_view.dart';
import 'package:azkary/Features/Azkar/presentation/view/doaas/doaas_view.dart';
import 'package:azkary/Features/Home/presentation/view/home_view.dart';
import 'package:azkary/Features/Home/presentation/view/widgets/salah_times_card.dart';
import 'package:azkary/Features/Salah/presentation/view/salah_view.dart';
import 'package:azkary/Features/Salah/presentation/view/salah_zekr_detailed.dart';
import 'package:azkary/Features/Salah/presentation/view/salahtimes.view.dart';
import 'package:azkary/Features/Tasbeah/presentation/manager/cubit/tasbeah_cubit.dart';
import 'package:azkary/Features/Tasbeah/presentation/view/tasbeah_view.dart';
import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/data/repos/quran_repo_imple.dart';
import 'package:azkary/Features/quran/presentation/views/manager/quran_cubit/quran_cubit.dart';
import 'package:azkary/Features/quran/presentation/views/quran_view.dart';
import 'package:azkary/Features/quran/presentation/views/widgets/surah_detailed_view.dart';
import 'package:azkary/core/cubit/cubit/pray_times_cubit.dart';
import 'package:azkary/core/services/prayertime_service.dart';
import 'package:azkary/core/utilises/service_locator.dart';
import 'package:azkary/splash_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const kHomeView = '/homeView';
  static const kAzkarView = '/AzkarView';
  static const kAzkarAlsabahView = '/AzkarAlsabahView';
  static const kTasbeahView = '/TasbeahView';
  static const kDoaaViewDetailed = '/DoaaViewDetailed';
  static const kDoaaView = '/DoaaView';
  static const kQuranView = '/QuranView';
  static const kSurahDetailedView = '/SurahDetailedView';
  static const kSalahView = '/SalahView';
  static const kSalahZekrDetailedView = '/SalahZekrDetailedView';
  static const kSalahTimesView = '/SalahTimesView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kAzkarView,
      builder: (context, state) => const AzkarView(),
    ),
    GoRoute(
      path: kAzkarAlsabahView,
      builder: (context, state) => const AzkarDetailsView(),
    ),
    GoRoute(
      path: kTasbeahView,
      builder: (context, state) => BlocProvider<TasbeahCubit>(
          create: (context) => TasbeahCubit(), child: const TasbeahView()),
    ),
    GoRoute(
      path: kDoaaView,
      builder: (context, state) => const DoaasView(),
    ),
    GoRoute(
      path: kDoaaViewDetailed,
      builder: (context, state) =>
          DoaasDetailedView(title: state.extra as String),
    ),
    GoRoute(
      path: kQuranView,
      builder: (context, state) => const QuranView(),
    ),
    GoRoute(
      path: kSurahDetailedView,
      builder: (context, state) =>
          SurahDetailedView(surah: state.extra! as Surah),
    ),
    GoRoute(
      path: kSalahView,
      builder: (context, state) => const SalahView(),
    ),
    GoRoute(
      path: kSalahZekrDetailedView,
      builder: (context, state) =>
          SalahZekrDetailed(title: state.extra as String),
    ),
    GoRoute(
        path: kSalahTimesView, builder: (context, state) => SalahTimesView()),
  ]);
}
