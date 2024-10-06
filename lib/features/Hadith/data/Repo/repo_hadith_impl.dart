import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';
import 'package:quran_app/features/Hadith/data/models/hadith.dart';
import 'package:quran_app/features/quran/data/models/data.dart';

import '../../../../core/functions/api_service.dart';
void main() async {
  final apiService = ApiService(dio: Dio());
  final repoSurah = RepoHadithImpl(apiservice: apiService);
  final result = await repoSurah.FetchHadith();
  result.fold(
        (failure) => print('Error: ${failure.toString()}'),
        (hadithData) => print('Fetched Surah: $hadithData'),
  );
}

class RepoHadithImpl extends RepoHadith {
  final ApiService apiservice;

  RepoHadithImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<Hadith>>> FetchHadith() async {
    try {
      var data = await apiservice.getHadith();
      // print(data); // Debugging: Print API response to ensure correct structure
      List<Hadith> hadithData = [];

      for (var i in data["hadiths"]) { // Ensure the key "Data" exists in the response
        hadithData.add(Hadith.fromJson(i));
      }


      print("Surah Data******************************: $hadithData");
      return right(hadithData);
    } catch (e) {
      print("Error fetching data: ${e.toString()}"); // Better error logging
      return left(ServerFailure(e.toString()));
    }
  }
}
