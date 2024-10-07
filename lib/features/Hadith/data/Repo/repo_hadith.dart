import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../../../quran/data/models/data.dart';
import '../models/Hadiths.dart';

abstract class RepoHadith{
  Future<Either<Failure, List<Data>>> FetchHadith();
}