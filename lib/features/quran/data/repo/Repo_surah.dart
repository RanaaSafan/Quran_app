


import 'package:dartz/dartz.dart';
import 'package:quran_app/features/quran/data/models/data.dart';

import '../../../../core/errors/failures.dart';
import '../models/surah.dart';

abstract class RepoSurah{

  Future<Either<Failure,List<Data>>> FetchSurah();

}