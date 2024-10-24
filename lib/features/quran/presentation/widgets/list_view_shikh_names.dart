import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/functions/api_service.dart';
import 'package:quran_app/features/quran/data/repo/Repo_surah_impl.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_cubit.dart';
import 'package:quran_app/features/quran/presentation/widgets/shikh_names.dart';
import '../controller/shikh_cubit.dart';
import '../controller/shikh_state.dart';
import '../controller/surah_state.dart';
import 'container_surah.dart';

class ListViewShikhNames extends StatefulWidget {
  const ListViewShikhNames({super.key});

  @override
  State<ListViewShikhNames> createState() => _ListViewShikhNamesState();
}

final reposurah = RepoSurahImpl(apiservice: ApiService(dio: Dio()));
final surahCubit = ShikhCubit(reposurah);

class _ListViewShikhNamesState extends State<ListViewShikhNames> {
  @override
  void initState() {
    super.initState();
    context.read<ShikhCubit>().getShikh(); // Fetch surahs when the widget is created
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShikhCubit, ShikhState>(
      builder: (context, state) {
        if (state is ShikhLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ShikhSuccess) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: state.shikhList.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 6),
            itemBuilder: (BuildContext context, int index) {
              final surah = state.shikhList[index];
              return ShikhNames(data: surah); // Pass the list of Data objects
            },
          );
        } else if (state is ShikhFailer) {
          return Center(child: Text('Error: ${state.errmsg}'));
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}
