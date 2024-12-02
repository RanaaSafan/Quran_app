import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/api_service.dart';
import '../../../../quran/data/repo/Repo_surah_impl.dart';
import '../../../../quran/presentation/controller/surah_state.dart';
import '../../../data/Repo/repo_hadith_impl.dart';
import '../../controller/hadith_cubit.dart';
import '../../controller/hadith_state.dart';
import '../widgets/hadith_container.dart';

class SliverGridContainer extends StatefulWidget {
  const SliverGridContainer({super.key});

  @override
  State<SliverGridContainer> createState() => _SliverGridContainerState();
}
final repohadith = RepoHadithImpl(apiservice: ApiService(dio: Dio()));
final hadithCubit = HadithCubit(repohadith);

class _SliverGridContainerState extends State<SliverGridContainer> {
  @override
  void initState() {
    super.initState();
    context.read<HadithCubit>()
        .getBook(); // Fetch surahs when the widget is created
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, HadithState>(
      builder: (context, state) {
        if (state is HadithLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HadithSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                    HadithContainer(
                      key: ValueKey(state.books[index].id!),
                      name: state.books[index].id!,
                    ),
                childCount: state.books.length,
              ),
            ),
          );
        } else if (state is HadithFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${state.error}')),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(child: Text('No data available')),
        );
      },
    );
  }
}
