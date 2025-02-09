import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/Home/data/Repo/prayer_repo_impl.dart';
import 'package:quran_app/features/Home/presentation/controller/prayer_state.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/container_prayer.dart';

import '../../../../../core/functions/api_service.dart';
import '../../controller/prayer_cubit.dart';

class ListContainerPrayer extends StatefulWidget {
  const ListContainerPrayer({super.key});

  @override
  State<ListContainerPrayer> createState() => _ListContainerPrayerState();
}

final repoPrayer = PrayerRepoImpl(apiservice: ApiService(dio: Dio()));
final prayerCubit = PrayerCubit(repoPrayer);
List<String> Data = [
  "الفجر",
  "الشروق",
  "الظهر",
  "العصر",
  "الغروب",
  "المغرب",
  "العشاء",
];

class _ListContainerPrayerState extends State<ListContainerPrayer> {
  late String date;

  @override
  void initState() {
    super.initState();

    date = DateTime.now().toIso8601String();
    context.read<PrayerCubit>().getPrayer(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("مواعيد الصلاه ",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 30),)),
        backgroundColor: const Color(0xFFA85000),
      ),
      body: BlocBuilder<PrayerCubit, PrayerState>(
        builder: (context, state) {
          if (state is PrayerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PrayerSuccess) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Data.length, // Number of prayer types
              itemBuilder: (BuildContext context, int index) {

                String time;
                switch (index) {
                  case 0:
                    time = state.timings[0].Fajr ?? 'N/A'; // وقت الفجر
                    break;
                  case 1:
                    time = state.timings[0].Sunrise ?? 'N/A'; // وقت الشروق
                    break;
                  case 2:
                    time = state.timings[0].Dhuhr ?? 'N/A'; // وقت الظهر
                    break;
                  case 3:
                    time = state.timings[0].Asr ?? 'N/A'; // وقت العصر
                    break;
                  case 4:
                    time = state.timings[0].Sunset ?? 'N/A'; // وقت الغروب
                    break;
                  case 5:
                    time = state.timings[0].Maghrib ?? 'N/A'; // وقت المغرب
                    break;
                  case 6:
                    time = state.timings[0].Isha ?? 'N/A'; // وقت العشاء
                    break;
                  default:
                    time = 'N/A'; // في حالة عدم العثور على الوقت
                }

                return ContainerPrayer(
                  time: time,
                  Prayer: Data[index],
                );
              },
            );
          } else if (state is PrayerFailure) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
