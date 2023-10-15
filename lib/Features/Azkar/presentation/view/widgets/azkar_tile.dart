import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

class AzkarTile extends StatelessWidget {
  const AzkarTile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.KprimaryColor2, width: 2)),
      child: Text(
        title,
        style: Styles.textStyle22
            .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
