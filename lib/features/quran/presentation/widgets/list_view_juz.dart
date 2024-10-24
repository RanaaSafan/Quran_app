import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/api_service.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah_impl.dart';
import 'container_jaz.dart';

class ListViewJuz extends StatefulWidget {
  const ListViewJuz({super.key});

  @override
  State<ListViewJuz> createState() => _ListViewJuzState();
}

final reposurah = RepoSurahImpl(apiservice: ApiService(dio: Dio()));
List<String> juzList = [];

class _ListViewJuzState extends State<ListViewJuz> {
  @override
  void initState() {
    super.initState();
    // Clear the list before adding items to avoid duplication
    juzList.clear();

    // Populate juzList with "Juz 1" to "Juz 30"
    for (int i = 1; i <= 30; i++) {
      juzList.add('Juz $i');
    }
  }


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: juzList.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 6),
      itemBuilder: (BuildContext context, int index) {
        final surah = juzList[index];
        return ContainerJaz(name: surah); // Pass the list of Juz
      },
    );
  }
}
