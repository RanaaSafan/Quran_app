import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import for BlocProvider
import 'package:quran_app/features/Hadith/presentation/views/widgets/hadith_container.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah_impl.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_cubit.dart'; // Import your Cubit

import 'core/functions/api_service.dart';
import 'core/utils/router_config.dart';
import 'features/Hadith/data/Repo/repo_hadith_impl.dart';
import 'features/Hadith/presentation/controller/hadith_cubit.dart';
import 'features/Hadith/presentation/views/screens/hadith_screen.dart';
import 'features/Hadith/presentation/views/widgets/sliver_grid_conatiner.dart';
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
    return  MaterialApp.router(
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          primaryColor: Color(0xFF35C2C1),
          textTheme: Typography.blackCupertino),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }

  }
//     return MaterialApp(
//       home: MultiBlocProvider(
//         providers: [
//          BlocProvider(create:(context) => SurahCubit(RepoSurahImpl(apiservice: ApiService(dio: Dio()))), ) ,
//           BlocProvider(create:(context) => HadithCubit(RepoHadithImpl(apiservice: ApiService(dio: Dio()))), ) ,
//         ],
//
//         // Provide the SurahCubit here
//         child:HadithScreen(),
//         //TabBarJuzsurah(), // Your TabBarJuzsurah widget
//       ),
//     );
//   }
// }
