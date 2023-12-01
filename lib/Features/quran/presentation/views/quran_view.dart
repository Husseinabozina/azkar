import 'package:azkary/Features/quran/data/repos/quran_repo_imple.dart';
import 'package:azkary/Features/quran/presentation/views/manager/quran_cubit/quran_cubit.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/utilises/arabic_sura_number.dart';
import 'package:azkary/core/utilises/service_locator.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    final quranCubit = BlocProvider.of<QuranCubit>(context);
    return BlocBuilder<QuranCubit, QuranState>(
      bloc: QuranCubit(getIt.get<QuranRepoImpl>()),
      builder: (context, state) {
        if (state is QuranGetSuccess) {
          final surahsList = state.surahsList;
          return Scaffold(
              body: Column(
            children: [
              const CustomViewAppBar(title: 'القرآن الكريم'),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: surahsList!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kSurahDetailedView,
                            extra: surahsList[index]);
                      },
                      child: Container(
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: (index % 2 != 0)
                            ? Colors.amberAccent.withOpacity(0.4)
                            : Colors.amberAccent.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ArabicSurahNumber(i: index),
                            Text(
                              surahsList[index].name!,
                              style: Styles.surahNameStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  quranCubit.fabToTrue();
                  quranCubit.getBookMark().then((value) => GoRouter.of(context)
                      .push(AppRouter.kSurahDetailedView,
                          extra: surahsList[quranCubit.surahIndex - 1]));
                },
                child: Icon(Icons.bookmark),
              ),
            ],
          ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
