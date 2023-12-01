import 'package:azkary/Features/Azkar/presentation/view/doaas/widget/doaa_detailed_Card.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SalahZekrDetailed extends StatelessWidget {
  const SalahZekrDetailed({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomViewAppBar(title: title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 20,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemBuilder: (context, index) => DoaaDetailedCard(
                              text: ' doaaList[index][]'!,
                              reference: ' doaaList[index][]'!,
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
