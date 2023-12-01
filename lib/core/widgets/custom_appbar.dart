import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomViewAppBar extends StatelessWidget {
  const CustomViewAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40).w,
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle30,
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}
