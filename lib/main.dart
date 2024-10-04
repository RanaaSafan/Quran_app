import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import for BlocProvider
import 'package:quran_app/features/quran/data/repo/Repo_surah_impl.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_cubit.dart'; // Import your Cubit

import 'core/functions/api_service.dart';
import 'features/quran/presentation/views/quran_screen.dart';
import 'features/quran/presentation/widgets/list_view_surah.dart';
import 'features/quran/presentation/widgets/tab_bar_juzSurah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => SurahCubit(RepoSurahImpl(apiservice: ApiService(dio: Dio()))), // Provide the SurahCubit here
        child: TabBarJuzsurah(), // Your TabBarJuzsurah widget
      ),
    );
  }
}
