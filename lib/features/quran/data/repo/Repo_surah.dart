


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/surah.dart';

abstract class RepoSurah{

  Future<Either<Failure,List<Surah>>> FetchSurah();

}