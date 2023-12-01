import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:azkary/core/widgets/custom_category_item.dart';
import 'package:flutter/material.dart';

class SalahView extends StatelessWidget {
  const SalahView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomViewAppBar(title: 'الصلاة'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomCategoryItem(
                    title: 'أذكار الصلاه ',
                    route: AppRouter.kSalahZekrDetailedView),
                SizedBox(
                  height: 20,
                ),
                CustomCategoryItem(
                    title: 'فضل الصلاه',
                    route: AppRouter.kSalahZekrDetailedView),
                SizedBox(
                  height: 20,
                ),
                CustomCategoryItem(
                    title: 'مواقيت', route: AppRouter.kSalahTimesView),
              ],
            ),
          )
        ],
      ),
    );
  }
}
