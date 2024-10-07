import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';
import '../../../../core/functions/api_service.dart';
import '../../../quran/data/models/data.dart';
import '../models/Hadiths.dart';

void main() async {
  final apiService = ApiService(dio: Dio());
  final repoHadith = RepoHadithImpl(apiservice: apiService);

  final result = await repoHadith.FetchHadith();

  result.fold(
        (failure) => print('Error: ${failure.toString()}'),
        (hadithData) => print('Fetched Hadith: $hadithData'),
  );
}

class RepoHadithImpl extends RepoHadith {
  final ApiService apiservice;

  RepoHadithImpl({required this.apiservice});


  @override
  Future<Either<Failure, List<Data>>> FetchHadith() async {
    try {
      final data = await apiservice.getHadith();

      // تحقق من وجود المفتاح "hadiths"
      if (data == null || !data.containsKey('hadiths')) {
        return left(ServerFailure("Received null or invalid data from API"));
      }

      List<Data> hadiths = [];
      for (var hadithData in data['hadiths']['data']) {
        hadiths.add(Data.fromJson(hadithData));
      }

      print("Fetched Hadiths: $hadiths");
      return right(hadiths);
    } catch (e) {
      print("Error fetching data: ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }
}
