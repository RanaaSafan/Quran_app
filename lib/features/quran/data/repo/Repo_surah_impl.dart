import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/functions/api_service.dart';
import '../models/data.dart';
import '../models/model_edition_surah/quran_edition.dart';

import '../models/model_surah_names/surah_datas.dart';


// void main() async {
//   final apiService = ApiService(dio: Dio());
//   final repoSurah = RepoSurahImpl(apiservice: apiService);
//   final result = await repoSurah.FetchSurahAudioShikh();
//   result.fold(
//         (failure) => print('Error: ${failure.toString()}'),
//         (surahList) => print('Fetched Surah: $surahList'),
//   );
// }

class RepoSurahImpl extends RepoSurah {
  final ApiService apiservice;

  RepoSurahImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<SurahDatas>>> FetchSurah() async {
    try {
      final endpoint = '/surah'; // Correct endpoint for fetching surahs
      var data = await apiservice.get(endPoints: endpoint);
     //  print(data);  Debugging: Print API response to ensure correct structure
      List<SurahDatas> surahData = [];

      for (var i in data["data"]) { // Ensure the key "Data" exists in the response
        surahData.add(SurahDatas.fromJson(i));
      }


     //print("Surah Data: $surahData");
      return right(surahData);

    } catch (e) {
      print("Error fetching data: ${e.toString()}"); // Better error logging
      return left(ServerFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failure, Data>> FetchSurahAudio(int value,String name) async {
    try {
      final endpoint = '/surah/$value/$name'; // Correct endpoint for fetching surahs
      var data = await apiservice.get(endPoints: endpoint);
       //print(data);
      Data surahData = Data.fromJson(data["data"]);

    //  print("Surah Data: $surahData");
      return right(surahData);

    } catch (e) {
      print("Error fetching data: ${e.toString()}"); // Better error logging
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<QuranEdition>>> FetchSurahAudioShikh() async {
    try {
      final endpoint = '/edition?format=audio&language=ar&type=versebyverse';
      var data = await apiservice.get(endPoints: endpoint);
      List<QuranEdition> surahData = [];

      for (var i in data["data"]) { // Ensure the key "Data" exists in the response
        surahData.add(QuranEdition.fromJson(i));
      }
      // print("Surah Data: $surahData");
      return right(surahData);

    } catch (e) {
      print("Error fetching data: ${e.toString()}"); // Better error logging
      return left(ServerFailure(e.toString()));
    }
  }

}
