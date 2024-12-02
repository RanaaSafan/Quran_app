import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/Hadith/data/Repo/repo_hadith.dart';

import 'package:quran_app/features/Hadith/data/models/name.dart';
import '../../../../core/functions/api_service.dart';
import '../../../quran/data/models/data.dart';

import '../models/book.dart';
import '../models/model_dataSheikh/hadiths.dart';

// Future<void> main() async {
//
//   final apiService = ApiService(dio: Dio());
//   final repoSurah = RepoHadithImpl(apiservice: apiService);
//   final result = await repoSurah.FetchHadithBySheikh();
//   result.fold(
//         (failure) => print('Error: ${failure.toString()}'),
//         (surahList) => print('Fetched Surah: $surahList'),
//   );
//
// }


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

  @override
  Future<Either<Failure, List<Hadiths>>> FetchHadithBySheikh(String name) async {
    //   try {
    //     final response = await apiservice.getHadithBySheikh('$name');
    //
    //     List<Hadiths> BooksDataSheikh = [];
    //
    //     for (var i in response["data"]['hadiths']) { // Ensure the key "Data" exists in the response
    //       BooksDataSheikh.add(Hadiths.fromJson(i));
    //     }
    //
    //     return right(BooksDataSheikh);
    //   } catch (e) {
    //     print("Error fetching data: ${e.toString()}");
    //     return left(ServerFailure(e.toString()));
    //   }
    // }
    try {
      final response = await apiservice.getHadithBySheikh(name);

      // Check if response contains the expected data
      if (response["data"] == null || response["data"]['hadiths'] == null) {
        return left(ServerFailure("Data not found"));
      }

      List<Hadiths> booksDataSheikh = [];

      for (var i in response["data"]['hadiths']) {
        booksDataSheikh.add(Hadiths.fromJson(i));
      }

      return right(booksDataSheikh);
    } catch (e) {
      print("Error fetching data: ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }
}
