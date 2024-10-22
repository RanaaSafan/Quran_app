


import 'package:dartz/dartz.dart';
import 'package:quran_app/features/quran/data/models/data.dart';

import '../../../../core/errors/failures.dart';
import '../models/surah.dart';
import '../models/surah_datas.dart';

abstract class RepoSurah{

  Future<Either<Failure,List<SurahDatas>>> FetchSurah();
  Future<Either<Failure,Data>> FetchSurahAudio();
}
