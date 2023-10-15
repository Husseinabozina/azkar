import 'package:azkary/Features/Azkar/presentation/view/widgets/azkar_tile.dart';
import 'package:azkary/Features/Azkar/presentation/view/widgets/azkar_view_appBar.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

List titles = [
  'أذكار الصباح',
  'أذكار المساء',
  'أذكار الاستيقاظ من النوم',
  'أذكار النوم',
  'أذكار الصلاة'
];

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AzkarViewAppBar(),
        SizedBox(
          height: 40,
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) => AzkarTile(title: titles[index]),
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
