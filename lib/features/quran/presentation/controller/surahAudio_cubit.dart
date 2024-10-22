import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah.dart';
import 'package:quran_app/features/quran/presentation/controller/surahAudio_state.dart';


class SurahAudioCubit extends Cubit<SurahAudioState> {
  final RepoSurah repoSurah;

  SurahAudioCubit(this.repoSurah) : super(SurahAudioInital());


  Future<void> getSurahAudio() async {
    emit(SurahAudioLoading());
    var result = await repoSurah.FetchSurahAudio();

    result.fold(
          (l) {
        emit(SurahAudioFailer(errmsg: l.errMessage));
        print('Surah failer: ${l.errMessage}');
      },
          (r) {
        emit(SurahAudioSuccess(surahListAudio:r));
        //   print('Reset password successful: $r');
      },
    );
  }

}
