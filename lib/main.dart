import 'package:azkary/Features/quran/data/repos/quran_repo_imple.dart';
import 'package:azkary/Features/quran/presentation/views/manager/quran_cubit/quran_cubit.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/cubit/cubit/pray_times_cubit.dart';
import 'package:azkary/core/services/prayertime_service.dart';
import 'package:azkary/core/utilises/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupServiceLocator();

  runApp(const MyApp());
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
                title: 'Flutter Demo',
                theme: ThemeData(
                  fontFamily: 'Aljazeera',
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
              ),
            ));
  }
}
