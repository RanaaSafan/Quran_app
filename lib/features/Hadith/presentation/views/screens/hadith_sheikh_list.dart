import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../core/functions/api_service.dart';
import '../../../data/Repo/repo_hadith_impl.dart';
import '../../controller/hadith_sheikh_cubit.dart';
import '../../controller/hadith_sheikh_state.dart';
import '../widgets/hadith_sheikh.dart';

class HadithSheikhList extends StatefulWidget {
  final String data;
  const HadithSheikhList({super.key, required this.data});

  @override
  State<HadithSheikhList> createState() => _HadithSheikhListState();
}

class _HadithSheikhListState extends State<HadithSheikhList> {
  late HadithSheikhCubit hadithSheikhCubit;

  @override
  void initState() {
    super.initState();
    hadithSheikhCubit = HadithSheikhCubit(
      RepoHadithImpl(apiservice: ApiService(dio: Dio())),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Ensure data is fetched after the widget is rendered
      hadithSheikhCubit.getBook(widget.data);
    });
  }

  @override
  void dispose() {
    hadithSheikhCubit.close(); // Close the cubit when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "حديث الشيخ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF522700),
      ),
      body: BlocProvider(
        create: (context) => hadithSheikhCubit,
        child: BlocBuilder<HadithSheikhCubit, HadithSheikhState>(
          builder: (context, state) {
            if (state is HadithSheikhLoading) {
              // عرض دائرة التحميل بينما البيانات قيد التحميل
              return const Center(child: CircularProgressIndicator());
            } else if (state is HadithSheikhSuccess) {
              // عرض البيانات عندما تكون التحميل قد انتهى
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: state.bookSheikh.length,
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 7),
                itemBuilder: (context, index) {
                  final hadith = state.bookSheikh[index]?.arab ?? ''; // Check for null
                  return HadithSheikh(data: hadith);
                },
              );
            } else if (state is HadithSheikhFailure) {
              // عرض رسالة الخطأ إذا فشل التحميل
              return Center(
                child: Text(
                  "Error: ${state.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              // حالة غير معروفة
              return const Center(child: Text("Unknown State"));
            }
          },
        ),
      ),
    );
  }
}
