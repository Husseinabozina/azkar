import 'package:azkary/Features/Home/presentation/view/widgets/grid_tile.dart';
import 'package:azkary/Features/Salah/presentation/view/salah_view.dart';
import 'package:azkary/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomCardGridView extends StatelessWidget {
  const CustomCardGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200.w,
          mainAxisExtent: 120.h,
          mainAxisSpacing: 20),
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSalahView);
          },
          child: const HomeTile(
            title: 'الصلاة',
            icon: FlutterIslamicIcons.solidKowtow,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kAzkarView);
          },
          child: HomeTile(
            title: 'الأذكار',
            icon: FlutterIslamicIcons.solidPrayer,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kTasbeahView);
          },
          child: HomeTile(
            title: 'التسبيح',
            icon: FlutterIslamicIcons.solidTasbihHand,
          ),
        ),
        HomeTile(
          title: "قيام الليل",
          icon: FlutterIslamicIcons.solidPrayingPerson,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kQuranView);
          },
          child: HomeTile(
            title: "الورد القرآني",
            icon: FlutterIslamicIcons.solidQuran2,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kDoaaView);
          },
          child: HomeTile(
            title: " جوامع الكلم",
            icon: FlutterIslamicIcons.solidMohammad,
          ),
        ),
      ],
    );
  }
}
