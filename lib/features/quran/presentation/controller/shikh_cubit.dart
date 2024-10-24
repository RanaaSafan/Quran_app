

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/functions/api_service.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah.dart';
import 'package:quran_app/features/quran/presentation/controller/shikh_state.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_state.dart';

import '../../data/repo/Repo_surah_impl.dart';

class ShikhCubit extends Cubit<ShikhState> {
  final RepoSurah repoSurah;

  ShikhCubit(this.repoSurah) : super(ShikhInital());


  Future<void> getShikh() async {
    emit(ShikhLoading());
    var result = await repoSurah.FetchSurahAudioShikh();

    result.fold(
          (l) {
        emit(ShikhFailer(errmsg: l.errMessage));
        print('Surah failer: ${l.errMessage}');
      },
          (r) {
        emit(ShikhSuccess(shikhList: r));
        //   print('Reset password successful: $r');
      },
    );
  }

}
