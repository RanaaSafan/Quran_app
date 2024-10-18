import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';
import 'package:quran_app/features/Hadith/data/models/name.dart';
import 'package:quran_app/features/Home/data/Repo/prayer_repo.dart';
import 'package:quran_app/features/Home/data/models/prayer_times.dart';
import 'package:quran_app/features/Home/data/models/timings.dart';
import '../../../../core/functions/api_service.dart';
import '../../../quran/data/models/data.dart';


// main() async {
//   final apiService = ApiService(dio: Dio());
//   final repoSurah = PrayerRepoImpl(apiservice: apiService);
//   final result = await repoSurah.FetchPrayer();
//   result.fold(
//         (failure) => print('Error: ${failure.toString()}'),
//         (surahList) => print('Fetched Surah: $surahList'),
//   );
// }
class PrayerRepoImpl extends PrayerRepo {
  final ApiService apiservice;

  PrayerRepoImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<Timings>>> FetchPrayer() async {
    try {
      final response = await apiservice.getPrayer();
      List<Timings> PrayerData = [];

      // for (var i in response["data"]["timings"]) { // Ensure the key "Data" exists in the response
      //   PrayerData.add(Timings.fromJson(i));
      // }  اللي راجع ماب مش ينفع تتخزن في ليست


      var timings = response["data"]["timings"];
      PrayerData.add(Timings.fromJson(timings));
      print(PrayerData);

      return right(PrayerData);
    } catch (e) {
      print("Error fetching data: ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }
}
