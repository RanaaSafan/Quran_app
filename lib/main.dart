import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import for BlocProvider
import 'package:quran_app/features/Home/presentation/controller/prayer_cubit.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah_impl.dart';
import 'package:quran_app/features/quran/presentation/controller/shikh_cubit.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_cubit.dart'; // Import your Cubit

import 'core/functions/api_service.dart';
import 'core/utils/router_config.dart';
import 'features/Hadith/data/Repo/repo_hadith_impl.dart';
import 'features/Hadith/presentation/controller/hadith_cubit.dart';

import 'features/Home/data/Repo/prayer_repo_impl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SurahCubit(RepoSurahImpl(apiservice: ApiService(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              HadithCubit(RepoHadithImpl(apiservice: ApiService(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              PrayerCubit(PrayerRepoImpl(apiservice: ApiService(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              ShikhCubit(RepoSurahImpl(apiservice: ApiService(dio: Dio()))),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          primaryColor: const Color(0xFF35C2C1),
          textTheme: Typography.blackCupertino,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
