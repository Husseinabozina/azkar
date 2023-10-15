import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

class SalahTimesCard extends StatelessWidget {
  const SalahTimesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [AppColors.KprimaryColor2, AppColors.KprimaryColor])),
      child: const Padding(
        padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
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
                    style: Styles.textStyle22,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '03:59',
                    style: Styles.textStyle22,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
