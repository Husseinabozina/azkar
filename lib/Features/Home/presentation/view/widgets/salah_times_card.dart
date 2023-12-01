import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalahTimesCard extends StatelessWidget {
  const SalahTimesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15).w,
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [AppColors.KprimaryColor2, AppColors.KprimaryColor])),
      child: Padding(
        padding: EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 0).r,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'لا إله إلا الله ',
                style: Styles.textStyle18,
              ),
              Text(
                'الصلاة القادمة',
                style: Styles.textStyle18,
              ),
              Text(
                'الصلاة القادمة',
                style: Styles.textStyle18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Pm',
                    style: Styles.textStyle23White,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '03:59',
                    style: Styles.textStyle23White,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
