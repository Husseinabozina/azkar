import 'package:azkary/Features/quran/data/repos/quran_repo_imple.dart';
import 'package:azkary/Features/quran/presentation/views/manager/quran_cubit/quran_cubit.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/cubit/cubit/pray_times_cubit.dart';
import 'package:azkary/core/services/cach_helper.dart';
import 'package:azkary/core/services/prayertime_service.dart';
import 'package:azkary/core/utilises/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupServiceLocator();
  CacheHelper.init();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('en'), // Default locale
      startLocale: Locale('ar'), // Start app in Arabic
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 900),
        builder: (context, child) => MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        PrayTimesCubit(PrayerTimeService())..fetchPrayTimes()),
                BlocProvider(
                  create: (context) =>
                      QuranCubit(getIt.get<QuranRepoImpl>())..fethAllSurahs(),
                )
              ],
              child: MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                locale: context.locale, // Localization support
                supportedLocales: context.supportedLocales, // Supported locales
                localizationsDelegates:
                    context.localizationDelegates, // Localization delegates
                theme: ThemeData(
                  fontFamily: 'Aljazeera',
                  // Text direction for RTL or LTR
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
              ),
            ));
  }
}
