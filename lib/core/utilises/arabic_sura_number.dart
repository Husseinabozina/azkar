import 'package:azkary/core/utilises/arabi_no_convert.dart';
import 'package:flutter/material.dart';

class ArabicSurahNumber extends StatelessWidget {
  const ArabicSurahNumber({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Text(
      // '\uFD3E' +
      (i + 1).toString().toArabicNumbers,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'UthmanicHafs',
        fontSize: 30,
        // shadows: [
        //   Shadow(
        //       offset: Offset(.5, .5),
        //       blurRadius: 1,
        //       color: Colors.amberAccent)
        // ]
      ),
    );
  }
}
