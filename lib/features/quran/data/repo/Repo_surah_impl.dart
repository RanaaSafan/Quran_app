
import 'package:dartz/dartz.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/functions/api_service.dart';
import '../models/surah.dart';



class RepoSurahImpl extends RepoSurah {
  final ApiService apiservice;

  RepoSurahImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<Surah>>> FetchSurah() async {
    try {
      final endpoint = ''; // Modify endpoint for pagination
      var data = await apiservice.get(endPoints: '/surah');
      List<Surah> SurahData = [];

      for (var i in data["Data"]) {
        SurahData.add(Surah.fromJson(i));
        print(SurahData);
      }
      return right(SurahData);

    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }


}