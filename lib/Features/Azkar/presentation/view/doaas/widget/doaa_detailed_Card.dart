import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';

class DoaaDetailedCard extends StatelessWidget {
  const DoaaDetailedCard(
      {super.key, required this.text, required this.reference});
  final String text;
  final String reference;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[400]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SelectableText(
            "(($text))",
            textDirection: TextDirection.rtl,
            style: Styles.textStyle23BlackGrey
                .copyWith(fontFamily: 'UthmanicHafs'),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(reference)],
          )
        ],
      ),
    );
  }
}
