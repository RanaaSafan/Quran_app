import 'package:dartz/dartz.dart';
import 'package:quran_app/features/Hadith/data/models/hadith.dart';

import '../../../../core/errors/failures.dart';
import '../../../quran/data/models/data.dart';

abstract class RepoHadith{
  Future<Either<Failure,List<Hadith>>> FetchHadith();
}