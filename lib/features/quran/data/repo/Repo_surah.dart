


import 'package:dartz/dartz.dart';
import 'package:quran_app/features/quran/data/models/data.dart';
import 'package:quran_app/features/quran/data/models/model_edition_surah/quran_edition.dart';

import '../../../../core/errors/failures.dart';

import '../models/model_surah_names/surah_datas.dart';


abstract class RepoSurah{

  Future<Either<Failure,List<SurahDatas>>> FetchSurah();
  Future<Either<Failure,Data>> FetchSurahAudio(int value,String name);
  Future<Either<Failure,List<QuranEdition>>> FetchSurahAudioShikh();
}
