import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/more/data/models/asmaa_husnai.dart';
import 'package:quran_app/features/more/data/repo/repo_asmaahusna.dart';
import '../../../../core/functions/api_service.dart';

Future<void> main() async {

  final apiService = ApiService(dio: Dio());
  final repoSurah = RepoAsmaahusnaImpl(apiservice: apiService);
  final result = await repoSurah.FetchAmsmaaHusna();
  result.fold(
        (failure) => print('Error: ${failure.toString()}'),
        (surahList) => print('Fetched Surah: $surahList'),
  );

}


class RepoAsmaahusnaImpl extends RepoAsmaahusna {
  final ApiService apiservice;

  RepoAsmaahusnaImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<AsmaUlHusna>>> FetchAmsmaaHusna() async {
    try {
      final response = await apiservice.getAsmaaHusna();


      List<AsmaUlHusna> Data = [];

      for (var i in response["data"]) {
        Data.add(AsmaUlHusna.fromJson(i));
      }

      return right(Data);
    } catch (e) {
      print("Error fetching data: ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }
}