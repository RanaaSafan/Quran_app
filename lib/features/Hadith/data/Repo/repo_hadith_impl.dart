import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';
import 'package:quran_app/features/Hadith/data/models/name.dart';
import '../../../../core/functions/api_service.dart';
import '../../../quran/data/models/data.dart';

import '../models/book.dart';



class RepoHadithImpl extends RepoHadith {
  final ApiService apiservice;

  RepoHadithImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<Book>>> FetchHadith() async {
    try {
      final response = await apiservice.getHadith();

      List<Book> BooksData = [];

      for (var i in response["data"]) { // Ensure the key "Data" exists in the response
        BooksData.add(Book.fromJson(i));
      }

      return right(BooksData);
    } catch (e) {
      print("Error fetching data: ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }
}
