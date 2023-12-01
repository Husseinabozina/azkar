import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/presentation/views/manager/quran_cubit/quran_cubit.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/utilises/arabi_no_convert.dart';
import 'package:azkary/core/utilises/arabic_sura_number.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/binding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahDetailedView extends StatefulWidget {
  SurahDetailedView({super.key, required this.surah});
  final Surah surah;

  @override
  State<SurahDetailedView> createState() => _SurahDetailedViewState();
}

class _SurahDetailedViewState extends State<SurahDetailedView> {
  late final bloc;

  jumbToAyah() {
    QuranCubit quranCubit = BlocProvider.of<QuranCubit>(context);
    if (quranCubit.fabIsClicked) {
      quranCubit.itemScrollController.scrollTo(
          index: quranCubit.ayahindex - 2,
          duration: Duration(seconds: 2),
          curve: Curves.ease);
    }
    quranCubit.fabToFalse();
  }

  @override
  void initState() {
    print(' surah name Is ${widget.surah.name}');
    WidgetsBinding.instance.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }

  Widget verse(String ayah, int index) {
    QuranCubit quranCubit = BlocProvider.of<QuranCubit>(context);
    return Container(
      color:
          index == quranCubit.ayahindex ? Colors.blue.withOpacity(0.4) : null,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // ArabicSurahNumber(i: index),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ayah + (index + 1).toString().toArabicNumbers,
                      textDirection: TextDirection.rtl,
                      style: Styles.quranFont40,
                    ),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          return ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: widget.surah.array!.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  if (index == 0) CustomViewAppBar(title: widget.surah.name!),
                  (index != 0) ||
                          (widget.surah.id == 1) ||
                          (widget.surah.id == 8)
                      ? const Text('')
                      : Text(
                          "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
                          textDirection: TextDirection.rtl,
                          style: Styles.quranFont40,
                        ),
                  Container(
                    color: index % 2 != 0
                        ? const Color.fromARGB(255, 253, 251, 240)
                        : Color.fromARGB(255, 253, 247, 230),
                    child: PopupMenuButton(
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: verse(widget.surah.array![index].ar!,
                              widget.surah.array![index].id!),
                        ),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () {
                                  BlocProvider.of<QuranCubit>(context)
                                      .saveBookMark(widget.surah.id, index + 2);
                                },
                                child: const Row(children: [
                                  Icon(Icons.bookmark_add),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Bookmark')
                                ]),
                              ),
                              const PopupMenuItem(
                                  child: Row(
                                children: [
                                  Icon(Icons.share,
                                      color: Color.fromARGB(255, 56, 115, 59)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Share')
                                ],
                              )),
                            ]),
                  )
                ],
              );
            },
            itemScrollController:
                BlocProvider.of<QuranCubit>(context).itemScrollController,
            itemPositionsListener:
                BlocProvider.of<QuranCubit>(context).itemPositionsListener,
          );
        },
      ),
    );
  }
}

// SurahDetailedView