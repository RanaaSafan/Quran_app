import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';
import 'package:quran_app/features/Hadith/data/models/name.dart';
import '../../../../core/functions/api_service.dart';
import '../../../quran/data/models/data.dart';
import '../models/Hadiths.dart';
import '../models/book.dart';
import '../models/hadith.dart';

void main() async {
  final apiService = ApiService(dio: Dio());
  final repoHadith = RepoHadithImpl(apiservice: apiService);

  final result = await repoHadith.FetchHadith();

  result.fold(
        (failure) => print('Error: ${failure.toString()}'),
        (BooksData) => print('Fetched Hadith: $BooksData'),
  );
}

class RepoHadithImpl extends RepoHadith {
  final ApiService apiservice;

  RepoHadithImpl({required this.apiservice});

  @override
  Future<Either<Failure, List<Book>>> FetchHadith() async {
    try {
      final response = await apiservice.getHadith();

      // تحقق من أن البيانات تأتي بشكل صحيح
      //final List<dynamic> dataList = response['hadiths']['data'];
   //   print(response["data"]);

     // List<Data> hadiths = dataList.map((hadithData) => Data.fromJson(hadithData)).toList();
      //print(hadiths);
     // print("Fetched Hadiths: $hadiths");
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
