import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/asmaa_husnai.dart';

abstract class RepoAsmaahusna{
  Future<Either<Failure, List<AsmaUlHusna>>> FetchAmsmaaHusna();

}
