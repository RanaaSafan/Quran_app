import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_app/core/functions/api_service.dart';

import '../../features/Hadith/data/Repo/repo_hadith_impl.dart';
import '../../features/Home/data/Repo/prayer_repo_impl.dart';
import '../../features/more/data/repo/repo_asmaahusna_impl.dart';
import '../../features/quran/data/repo/Repo_surah_impl.dart';
final getIt = GetIt.instance;


Future<void> setupServiceLocator() async {
  //dio & ApiService
  // Dio dio = await ApiService.getInstance();
  // getIt.registerSingleton<ApiService>(ApiService(dio));
  //repos
  Dio dio = Dio();
  getIt.registerSingleton<ApiService>(ApiService(dio: dio));
  
  getIt.registerSingleton<RepoSurahImpl>(RepoSurahImpl(apiservice: getIt.get<ApiService>()));

  getIt.registerSingleton<RepoHadithImpl>(RepoHadithImpl(apiservice: getIt.get<ApiService>()));

  getIt.registerSingleton<PrayerRepoImpl>(PrayerRepoImpl(apiservice: getIt.get<ApiService>()));

  getIt.registerSingleton<RepoAsmaahusnaImpl>(RepoAsmaahusnaImpl(apiservice: getIt.get<ApiService>()));

}