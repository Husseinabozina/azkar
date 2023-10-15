import 'package:azkary/Features/Home/presentation/view/widgets/grid_tile.dart';
import 'package:azkary/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
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
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          mainAxisExtent: 120,
          mainAxisSpacing: 20),
      children: [
        const HomeTile(
          title: 'الصلاة',
          icon: FlutterIslamicIcons.solidKowtow,
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
        HomeTile(
          title: 'التسبيح',
          icon: FlutterIslamicIcons.solidTasbihHand,
        ),
        HomeTile(
          title: "قيام الليل",
          icon: FlutterIslamicIcons.solidPrayingPerson,
        ),
        HomeTile(
          title: "الورد القرآني",
          icon: FlutterIslamicIcons.solidQuran2,
        ),
        HomeTile(
          title: " جوامع الكلم",
          icon: FlutterIslamicIcons.solidMohammad,
        ),
      ],
    );
  }
}
