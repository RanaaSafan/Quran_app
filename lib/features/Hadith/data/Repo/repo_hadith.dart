import 'package:dartz/dartz.dart';
import 'package:quran_app/features/Hadith/data/models/name.dart';

import '../../../../core/errors/failures.dart';


import '../models/book.dart';
import '../models/model_dataSheikh/hadiths.dart';


abstract class RepoHadith{
  Future<Either<Failure, List<Book>>> FetchHadith();
  Future<Either<Failure, List<Hadiths>>> FetchHadithBySheikh(String name);
}
