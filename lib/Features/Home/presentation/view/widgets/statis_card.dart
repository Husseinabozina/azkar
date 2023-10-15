import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

class StatisCard extends StatelessWidget {
  const StatisCard({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.KprimaryColor,
          borderRadius: BorderRadius.circular(10)),
      height: 100,
      width: 110,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          title,
          style: Styles.textStyle20.copyWith(color: Colors.white),
        ),
        Text(
          count.toString(),
          style: Styles.textStyle20.copyWith(color: Colors.white),
        ),
      ]),
    );
  }
}
