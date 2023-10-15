import 'package:azkary/Features/Home/presentation/view/widgets/custom_card_gridview.dart';
import 'package:azkary/Features/Home/presentation/view/widgets/home_view_appbar.dart';
import 'package:azkary/Features/Home/presentation/view/widgets/salah_times_card.dart';
import 'package:azkary/Features/Home/presentation/view/widgets/statis_card.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const HomeViewAppBar(),
          const SizedBox(
            height: 30,
          ),
          const SalahTimesCard(),
          const CustomCardGridView(),
          const SizedBox(
            height: 8,
          ),
          Text(
            'آخر 7 أيام',
            style: Styles.textStyle20.copyWith(color: AppColors.KprimaryColor),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatisCard(
                title: "صفحات القرآن",
                count: 458,
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
    );
  }
}
