import 'package:azkary/Features/Tasbeah/presentation/manager/cubit/tasbeah_cubit.dart';
import 'package:azkary/Features/Tasbeah/presentation/view/widgets/tasbeah_zekr_item.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/services/mushaf_services.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> titles = [
  'سبحان الله',
  "الحمد لله",
  "الله أكبر",
  "لا إله إلا الله",
  "سبحان الله وبحمده",
];

class TasbeahViewBody extends StatelessWidget {
  const TasbeahViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasbeahCubit, TasbeahState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final tasbeahcubit = BlocProvider.of<TasbeahCubit>(context);
        return Column(
          children: [
            CustomViewAppBar(title: 'التسبيح'),
            SizedBox(
              height: 30,
            ),
            Ink(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.KprimaryColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(75)),
              child: InkWell(
                splashColor: AppColors.KprimaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(75),
                onTap: () async {
                  tasbeahcubit.changeCounter();
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tasbeahcubit.selectedZedr,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(tasbeahcubit.tasbeahCounter.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColors.KprimaryColor,
                          ))
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.sp,
                ),
                itemBuilder: (context, index) => Ink(
                    child: GestureDetector(
                        onTap: () {
                          tasbeahcubit.selectZekr(titles[index]);
                        },
                        child: TasbeahZekrItem(title: titles[index]))),
                itemCount: titles.length,
              ),
            )
          ],
        );
      },
    );
  }
}
