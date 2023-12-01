import 'package:azkary/core/widgets/custom_category_item.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

List titles = [
  'أذكار الصباح',
  'أذكار المساء',
  'أذكار الاستيقاظ من النوم',
  'أذكار النوم',
  'أذكار الصلاة'
];

class AzkarCategoriesViewBody extends StatelessWidget {
  const AzkarCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomViewAppBar(title: 'أذكار المسلم'),
        SizedBox(
          height: 40.h,
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) => CustomCategoryItem(
                title: titles[index],
                route: AppRouter.kAzkarAlsabahView,
              ),
              itemCount: titles.length,
            )
            //  Column(
            //   children: [
            //     AzkarTile(
            //       title: 'أذكار الصباح',
            //     ),
            //     AzkarTile(
            //       title: 'أذكار الاستيفاظ من النوم',
            //     ),
            //     AzkarTile(
            //       title: 'أذكار المساء',
            //     ),
            //     AzkarTile(
            //       title: 'أذكار النوم',
            //     ),
            //     AzkarTile(
            //       title: 'أذكار الصلاة',
            //     ),
            //   ],
            // ),
            )
      ],
    );
  }
}
