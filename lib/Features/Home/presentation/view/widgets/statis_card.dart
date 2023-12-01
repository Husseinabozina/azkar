import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          color: AppColors.KprimaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)),
      height: 100.h,
      width: 110.w,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          title,
          style: Styles.textStyle21.copyWith(color: Colors.white),
        ),
        Text(
          count.toString(),
          style: Styles.textStyle21.copyWith(color: Colors.white),
        ),
      ]),
    );
  }
}
