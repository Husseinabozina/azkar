import 'package:azkary/Features/Tasbeah/presentation/manager/cubit/tasbeah_cubit.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasbeahZekrItem extends StatelessWidget {
  const TasbeahZekrItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final tasbeahCubit = BlocProvider.of<TasbeahCubit>(context);
    return Container(
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.KprimaryColor2, width: 2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            tasbeahCubit.tasbeahCounter.toString(),
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
          Container(
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: Styles.textStyle21.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
