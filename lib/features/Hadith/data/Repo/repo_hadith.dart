import 'package:dartz/dartz.dart';
import 'package:quran_app/features/Hadith/data/models/name.dart';

import '../../../../core/errors/failures.dart';

import '../../../quran/data/models/data.dart';
import '../models/Hadiths.dart';
import '../models/book.dart';

abstract class RepoHadith{
  Future<Either<Failure, List<Book>>> FetchHadith();
}