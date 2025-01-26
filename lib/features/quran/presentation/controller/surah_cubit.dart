import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final RepoSurah repoSurah;

  SurahCubit(this.repoSurah) : super(SurahInital());


  Future<void> getSurah() async {
    emit(SurahLoading());
    var result = await repoSurah.FetchSurah();

    result.fold(
          (l) {
        emit(SurahFailer(errmsg: l.errMessage));
        print('Surah failer: ${l.errMessage}');
      },
          (r) {
        emit(SurahSuccess(surahList:r));
        //   print('Reset password successful: $r');
      },
    );
  }

}
