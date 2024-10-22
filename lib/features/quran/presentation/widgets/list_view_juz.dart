import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/functions/api_service.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah_impl.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_cubit.dart';
import '../controller/surah_state.dart';
import 'container_surah.dart';

class ListViewJuz extends StatefulWidget {
  const ListViewJuz({super.key});

  @override
  State<ListViewJuz> createState() => _ListViewJuzState();
}

final reposurah = RepoSurahImpl(apiservice: ApiService(dio: Dio()));
final surahCubit = SurahCubit(reposurah);
List<String> juzList=[];


class _ListViewJuzState extends State<ListViewJuz> {
  @override
  void initState() {
    super.initState();
    context.read<SurahCubit>().getSurah(); // Fetch surahs when the widget is created
    for(int i=1;i<=30;i++)  {
      juzList.add('Juz $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SurahSuccess) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: juzList.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 6),
            itemBuilder: (BuildContext context, int index) {
              final surah = state.surahList[index];
              return ContainerSurah(data: surah); // Pass the list of Data objects
            },
          );
        } else if (state is SurahFailer) {
          return Center(child: Text('Error: ${state.errmsg}'));
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}
