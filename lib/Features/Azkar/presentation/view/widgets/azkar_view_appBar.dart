import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

class AzkarViewAppBar extends StatelessWidget {
  const AzkarViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          Spacer(),
          Text(
            'أذكار المسلم',
            style: Styles.textStyle30,
          )
        ],
      ),
    );
  }
}
