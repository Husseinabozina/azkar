import 'package:azkary/Features/Home/presentation/view/widgets/custom_card_gridview.dart';
import 'package:azkary/Features/Home/presentation/view/widgets/home_view_appbar.dart';
import 'package:azkary/Features/Home/presentation/view/widgets/salah_times_card.dart';
import 'package:azkary/Features/Home/presentation/view/widgets/statis_card.dart';
import 'package:azkary/Features/quran/data/repos/quran_repo_imple.dart';
import 'package:azkary/Features/quran/presentation/views/manager/quran_cubit/quran_cubit.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/service_locator.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Future<Response> fetchPrayerTimings() {
    late Dio dio = Dio();
    String url =
        'https://api.aladhan.com/v1/timingsByCity/30-11-2023?city=Dumyat&country=Egypt&method=8';
    return dio.get(url);
  }

  @override
  void initState() {
    Dio dio = Dio();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final result = await dio.get(url);
    // Map<String, dynamic> data = result.data;

    return FutureBuilder(
      future: fetchPrayerTimings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 50,
            ).w,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const HomeViewAppBar(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const SalahTimesCard(),
                  const CustomCardGridView(),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'آخر 7 أيام',
                    style: Styles.textStyle21Primary,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: StatisCard(
                          title: "صفحات القرآن",
                          count: 458,
                        ),
                      ),
                      StatisCard(
                        title: 'التسبيح',
                        count: 458,
                      ),
                      StatisCard(
                        title: 'قيام الليل ',
                        count: 458,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
