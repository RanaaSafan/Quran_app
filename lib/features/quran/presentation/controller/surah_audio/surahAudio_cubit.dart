


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/features/quran/data/repo/Repo_surah.dart';
import 'package:quran_app/features/quran/presentation/controller/shikh_state.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_audio/surahAudio_state.dart';

class SurahaudioCubit extends Cubit<SurahAudioState> {
  final RepoSurah repoSurah;

  SurahaudioCubit(this.repoSurah) : super(SurahAudioInital());


  Future<void> getSurahAudio(int value , String name) async {
    emit(SurahAudioLoading());
    var result = await repoSurah.FetchSurahAudio(value, name);

    result.fold(
          (l) {
        emit(SurahAudioFailer(errmsg: l.errMessage));
        print('Surah failer: ${l.errMessage}');
      },
          (r) {
        emit(SurahAudioSuccess(surahListAudio: r));

      },
    );
  }

}
