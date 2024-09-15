import 'package:audioplayers/audioplayers.dart';
import 'package:azkary/Features/quran/data/models/surah/surah.dart';
import 'package:azkary/Features/quran/presentation/views/manager/quran_cubit/quran_cubit.dart';
import 'package:azkary/core/app_router.dart';
import 'package:azkary/core/cosntant.dart';
import 'package:azkary/core/services/cach_helper.dart';
import 'package:azkary/core/utilises/app_colors.dart';
import 'package:azkary/core/utilises/arabi_no_convert.dart';
import 'package:azkary/core/utilises/arabic_sura_number.dart';
import 'package:azkary/core/utilises/styles.dart';
import 'package:azkary/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/binding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  bool view = true;
  int currentAyahIndex = 0;

  void jumbToAyah() {
    final quranCubit = context.read<QuranCubit>();
    if (quranCubit.fabIsClicked) {
      quranCubit.itemScrollController.scrollTo(
        alignment: 0.5,
        index: CacheHelper.get(key: "ayah"),
        duration: const Duration(seconds: 2),
      );
    }
    quranCubit.fabToFalse();
  }

  @override
  void initState() {
    super.initState();
    // Safe async operations in post-frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      jumbToAyah();

      final quranCubit = context.read<QuranCubit>();
      if (mounted) {
        quranCubit.getSurahTafseer(widget.surah.id!);
        quranCubit
            .getSurahAudio(widget.surah.id!); // Fetch the audio for this Surah
      }
    });
  }

  Widget verse(String ayah, int index) {
    final quranCubit = context.read<QuranCubit>();
    return Container(
      color: (index == CacheHelper.get(key: 'ayah') &&
              (widget.surah.id! - 1 == CacheHelper.get(key: 'surah')))
          ? Colors.blue.withOpacity(0.4)
          : null,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ayah + (index).toString().toArabicNumbers,
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
  void dispose() {
    // Ensure that item positions listener is safely removed
    final quranCubit = context.read<QuranCubit>();
    quranCubit.itemPositionsListener.itemPositions.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomViewAppBar(title: widget.surah.name!),
      backgroundColor: AppColors.colorQuranBackground,
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          final quranCubit = context.read<QuranCubit>();
          return ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: widget.surah.array!.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  (index != 0 || widget.surah.id == 1 || widget.surah.id == 8)
                      ? const Text('')
                      : Text(
                          "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
                          textDirection: TextDirection.rtl,
                          style: Styles.quranFont40,
                        ),
                  Container(
                    color: index % 2 != 0
                        ? const Color.fromARGB(255, 253, 251, 240)
                        : const Color.fromARGB(255, 253, 247, 230),
                    child: PopupMenuButton(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              currentAyahIndex = index;
                            });
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AyahDialoge(
                                  cubit: quranCubit,
                                  currentAyahIndex: currentAyahIndex,
                                  widget: widget,
                                  state: state,
                                  surahNumber: widget.surah.id!,
                                );
                              },
                            );
                          },
                          child: verse(widget.surah.array![index].ar!,
                              widget.surah.array![index].id!),
                        ),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            quranCubit.saveBookMark(widget.surah.id, index + 1);
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.bookmark_add, color: Colors.white),
                              SizedBox(width: 10),
                              Text('فاصل',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(Icons.share,
                                  color: Color.fromARGB(255, 66, 255, 76)),
                              SizedBox(width: 10),
                              Text('Share',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 66, 255, 76))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemScrollController: quranCubit.itemScrollController,
            itemPositionsListener: quranCubit.itemPositionsListener,
          );
        },
      ),
    );
  }
}

class AyahDialoge extends StatefulWidget {
  const AyahDialoge({
    super.key,
    required this.cubit,
    required this.currentAyahIndex,
    required this.widget,
    required this.state,
    required this.surahNumber,
  });

  final QuranCubit cubit;
  final int currentAyahIndex;
  final SurahDetailedView widget;
  final QuranState state;
  final int surahNumber;

  @override
  State<AyahDialoge> createState() => _AyahDialogeState();
}

class _AyahDialogeState extends State<AyahDialoge> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isDownloading = false;
  bool surahAudiosDownloaded = false;

  @override
  void initState() {
    super.initState();
    // Check if Surah audios are already downloaded
    surahAudiosDownloaded = widget.cubit.surahAudios.isNotEmpty;
  }

  Future<void> _playAyahAudio() async {
    if (widget.cubit.surahAudios.isNotEmpty) {
      String ayahAudioUrl =
          widget.cubit.surahAudios[widget.currentAyahIndex].audio;
      await _audioPlayer.play(UrlSource(ayahAudioUrl));
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> _promptAndDownloadAudio() async {
    if (surahAudiosDownloaded) {
      _playAyahAudio(); // Play audio if already downloaded
    } else {
      bool? downloadAll = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Download all audios?'),
            content: const Text(
                'Do you want to download all audios for this Surah?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );

      if (downloadAll == true) {
        setState(() {
          isDownloading = true; // Show CircularProgressIndicator
        });

        // Fetch Surah audios from QuranCubit
        await widget.cubit.getSurahAudio(widget.surahNumber);

        setState(() {
          isDownloading = false; // Hide CircularProgressIndicator when done
          surahAudiosDownloaded = true; // Mark as downloaded
        });

        _playAyahAudio(); // Play the specific ayah audio after download
      } else {
        _playAyahAudio(); // Play only the selected ayah
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          // Handle audio fetching success/failure
          if (state is GetQuranSurahAudioSuccess) {
            // Surah audios downloaded, update flag
            setState(() {
              surahAudiosDownloaded = true;
              isDownloading = false;
            });
            _playAyahAudio(); // Play audio once downloaded
          } else if (state is GetQuranSurahAudioFailure) {
            // Handle error
            setState(() {
              isDownloading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Failed to download audios: ${state.msg}')),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(top: 30.h),
            decoration: BoxDecoration(
              color: AppColors.colorQuranBackground,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            height: 530.h,
            width: double.infinity,
            child: Stack(
              children: [
                widget.state is! QuranGetSurahTafseerFailure &&
                        widget.cubit.surahTafseer != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          height: 530.h - 100.h,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  widget
                                      .cubit
                                      .surahTafseer![widget.currentAyahIndex]
                                      .arabicText!,
                                  style: const TextStyle(
                                      fontFamily: 'UthmanicHafs',
                                      color: Color.fromARGB(255, 152, 24, 15),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  widget
                                      .cubit
                                      .surahTafseer![widget.currentAyahIndex]
                                      .translation!,
                                  style: const TextStyle(fontSize: 19),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Center(child: SizedBox()),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 70.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Color(0xFF3b4622),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.colorQuranBackground,
                          ),
                        ),
                        SizedBox(width: 30.w),
                        IconButton(
                          onPressed: () {
                            widget.cubit
                                .saveBookMark(widget.widget.surah.id,
                                    widget.currentAyahIndex + 1)
                                .then((_) {
                              Navigator.pop(context);
                            });
                          },
                          icon: const Icon(
                            Icons.bookmark,
                            color: AppColors.colorQuranBackground,
                          ),
                        ),
                        SizedBox(width: 30.w),
                        isDownloading
                            ? const CircularProgressIndicator(
                                color: AppColors.colorQuranBackground,
                              )
                            : IconButton(
                                onPressed: () {
                                  if (isPlaying) {
                                    _pauseAudio();
                                  } else {
                                    _promptAndDownloadAudio(); // Download and play ayah
                                  }
                                },
                                icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  color: AppColors.colorQuranBackground,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

// SurahDetailedView
