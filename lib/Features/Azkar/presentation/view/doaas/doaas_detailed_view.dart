import 'package:azkary/Features/Azkar/presentation/view/doaas/widget/doaa_detailed_Card.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:azkary/data/doaas.dart';
import 'package:flutter/material.dart';

class DoaasDetailedView extends StatelessWidget {
  const DoaasDetailedView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> doaaList =
        title == 'أدعية من القرآن' ? DoaasFromQuran : doasFromSona;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomViewAppBar(title: title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: doaaList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemBuilder: (context, index) => DoaaDetailedCard(
                        text: doaaList[index]['zekr']!,
                        reference: doaaList[index]['reference']!,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
