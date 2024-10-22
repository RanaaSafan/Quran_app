import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/presentation/controller/surahAudio_cubit.dart';

import '../../../../core/functions/api_service.dart';
import '../../data/repo/Repo_surah_impl.dart';
import '../controller/surahAudio_state.dart';
import '../controller/surah_cubit.dart';
import '../controller/surah_state.dart';

class QuranText extends StatefulWidget {
  const QuranText({super.key});

  @override
  State<QuranText> createState() => _QuranTextState();
}
final reposurah = RepoSurahImpl(apiservice: ApiService(dio: Dio()));
final surahCubit = SurahAudioCubit(reposurah);


class _QuranTextState extends State<QuranText> {
  @override
  void initState() {
    super.initState();
    context
        .read<SurahCubit>()
        .repoSurah; // Fetch surahs when the widget is created
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahAudioCubit, SurahAudioState>(
      builder: (context, state) {
        if (state is SurahAudioLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SurahAudioSuccess) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: state.surahListAudio.ayahs!.length,
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 6),
            itemBuilder: (BuildContext context, int index) {
              final surah = state.surahListAudio?.ayahs?[index]?.text!;
              return Row(
                children: [
                  Text(surah!, style: TextStyle(fontSize: 10),),
                ],
              ); // Pass the list of Data objects
            },
          );
        } else if (state is SurahAudioFailer) {
          return Center(child: Text('Error: ${state.errmsg}'));
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}
//حاسه اني بهبد بامانه