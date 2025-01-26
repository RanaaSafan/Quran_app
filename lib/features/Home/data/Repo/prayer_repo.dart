import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/timings.dart';

abstract class PrayerRepo{
  Future<Either<Failure, List<Timings>>> FetchPrayer(String date);
}
