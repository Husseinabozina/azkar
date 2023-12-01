import 'package:azkary/Features/Azkar/presentation/view/Azar_view.dart/widgets/azkar_view_body.dart';
import 'package:azkary/Features/Azkar/presentation/view/doaas/doaas_detailed_view.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:azkary/core/widgets/custom_category_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoaasView extends StatelessWidget {
  const DoaasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomViewAppBar(title: 'أدعية'),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomCategoryItem(
                  title: 'أدعية من القرآن', route: AppRouter.kDoaaViewDetailed),
              const SizedBox(
                height: 20,
              ),
              const CustomCategoryItem(
                title: "أدعية من السنة",
                route: AppRouter.kDoaaViewDetailed,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
