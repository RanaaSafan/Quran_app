import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/functions/api_service.dart';
import '../models/surah.dart';

// void main() async {
//   final apiService = ApiService(dio: Dio());
//   final repoSurah = RepoSurahImpl(apiservice: apiService);
//   final result = await repoSurah.FetchSurah();
//   result.fold(
//         (failure) => print('Error: ${failure.toString()}'),
//         (surahList) => print('Fetched Surah: $surahList'),
//   );
// }

class RepoSurahImpl extends RepoSurah {
  final ApiService apiservice;

  RepoSurahImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<Surah>>> FetchSurah() async {
    try {
      final endpoint = '/surah'; // Correct endpoint for fetching surahs
      var data = await apiservice.get(endPoints: endpoint);
    // print(data); // Debugging: Print API response to ensure correct structure
      List<Surah> surahData = [];

      for (var i in data["data"]) { // Ensure the key "Data" exists in the response
        surahData.add(Surah.fromJson(i));
      }
      print("Surah Data: $surahData");
      return right(surahData);

    } catch (e) {
      print("Error fetching data: ${e.toString()}"); // Better error logging
      return left(ServerFailure(e.toString()));
    }
  }
}
