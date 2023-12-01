import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
          Text(
            title,
            style: Styles.textStyle23White,
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15).w,
          color: AppColors.KprimaryColor2),
    );
  }
}
