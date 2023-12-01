import 'package:azkary/core/helpers/shared_preferens/font_helper.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static final textStyle18 = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.white);
  static final textStyle21 = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.bold,
  );
  static final textStyle21Primary = TextStyle(
      fontSize: 21.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.KprimaryColor);

  static final textStyle23White = TextStyle(
      fontSize: 23.sp, fontWeight: FontWeight.w900, color: Colors.white);
  static final textStyle23BlackGrey = TextStyle(
      fontSize: 23.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.KTitleColor);
  static final textStyle30 = TextStyle(
      fontSize: 30.sp,
      letterSpacing: 1.2.sp,
      fontFamily: 'Aljazeera',
      color: AppColors.KTitleColor,
      fontWeight: FontWeight.bold);
  static final quranFont40 = TextStyle(
    fontSize: PrefHelper.kQuranFontSize.sp,
    fontFamily: 'UthmanicHafs',
    color: AppColors.KTitleColor,
  );
  static final surahNameStyle = TextStyle(
    fontSize: 27.sp,
    fontFamily: 'UthmanicHafs',
    color: AppColors.KTitleColor,
  );
}
