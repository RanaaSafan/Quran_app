import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import for BlocProvider
import 'package:quran_app/features/Home/presentation/controller/prayer_cubit.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/bottom_navigation_home.dart';
import 'package:quran_app/features/more/data/repo/repo_asmaahusna_impl.dart';
import 'package:quran_app/features/more/presentation/controller/asmaa_allah_cubit.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah_impl.dart';

import 'package:quran_app/features/quran/presentation/controller/shikh_cubit.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_cubit.dart'; // Import your Cubit

import 'core/functions/api_service.dart';

import 'features/Hadith/data/Repo/repo_hadith_impl.dart';
import 'features/Hadith/presentation/controller/hadith_cubit.dart';

import 'features/Hadith/presentation/controller/hadith_sheikh_cubit.dart';
import 'features/Home/data/Repo/prayer_repo_impl.dart';

import 'features/quran/presentation/controller/surah_audio/surahAudio_cubit.dart';


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
              HadithSheikhCubit(RepoHadithImpl(apiservice: ApiService(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              PrayerCubit(PrayerRepoImpl(apiservice: ApiService(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              ShikhCubit(RepoSurahImpl(apiservice: ApiService(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              AsmaaAllahCubit(RepoAsmaahusnaImpl(apiservice: ApiService(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              SurahaudioCubit(RepoSurahImpl(apiservice: ApiService(dio: Dio()))),
        ),

      ],
      child:  MaterialApp(
        home: BottomNavigationHome(),
      ),

    );
  }
}
