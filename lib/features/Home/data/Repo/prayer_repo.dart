import 'package:dartz/dartz.dart';
import 'package:quran_app/features/Home/data/models/prayer_times.dart';


import '../../../../core/errors/failures.dart';
import '../../../quran/data/models/data.dart';
import '../models/timings.dart';



abstract class PrayerRepo{
  Future<Either<Failure, List<Timings>>> FetchPrayer();
}
