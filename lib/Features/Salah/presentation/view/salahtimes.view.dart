import 'package:azkary/core/cubit/cubit/pray_times_cubit.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalahTimesView extends StatelessWidget {
  const SalahTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PrayTimesCubit, PrayTimesState>(
          builder: (context, state) {
        if (state is PrayTimesSuccess) {
          return Column(
            children: [
              const CustomViewAppBar(title: 'مواقيت الصلاه'),
              const SizedBox(
                height: 40,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.prayList!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: AppColors.KprimaryColor,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                state.prayList![index].name,
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                state.prayList![index].time.substring(0, 5),
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ))
            ],
          );
        } else if (state is PrayTimesFailure) {
          return const Center(
              child: Text('there is an error, try again later'));
        } else {
          print(state);
          return const Center(
            child: Center(
                child: Text(
                    'another thingssssssssssssssssssssssssssssssssssssssssssssssss')),
          );
        }
      }),
    );
  }
}
