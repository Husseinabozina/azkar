import 'package:azkary/core/app_assets.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AppAssets.logo),
          )),
        ),
        Spacer(),
        Text(
          'أذكاري',
          style: Styles.textStyle30,
        )
      ],
    );
  }
}
