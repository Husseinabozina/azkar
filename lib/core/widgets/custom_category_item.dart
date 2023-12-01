import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem(
      {super.key, required this.title, required this.route});
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(route, extra: title);
      },
      child: Container(
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.KprimaryColor, width: 2)),
        child: Text(
          title,
          style: Styles.textStyle23BlackGrey.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
