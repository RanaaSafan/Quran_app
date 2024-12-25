import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/quran/data/models/model_edition_surah/quran_edition.dart';
import 'package:quran_app/features/quran/presentation/widgets/audio_screen.dart';
import 'package:quran_app/features/quran/presentation/widgets/ayahs_surah.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_detail_screen.dart';
import '../../../../core/functions/api_service.dart';

import '../../data/models/model_surah_names/surah_datas.dart';
import '../../data/repo/Repo_surah_impl.dart';
import '../controller/surah_audio/surahAudio_cubit.dart';

class ContainerSurah extends StatefulWidget {
  const ContainerSurah({super.key, required this.data, required this.quran});
  final SurahDatas data;
  final QuranEdition quran;

  @override
  State<ContainerSurah> createState() => _ContainerSurahState();
}

class _ContainerSurahState extends State<ContainerSurah> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFA85000),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   // child: IconButton(
                //   //   icon: Icon(isPlaying
                //   //       ? Icons.pause_circle_filled
                //   //       : Icons.play_circle_filled,
                //   //       size: 30, color: Colors.white),
                //   //   onPressed: toggleAudio, // Toggle play/pause on press
                //   // ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>AudioScreen(data: widget.data, quran: widget.quran) ,
                        ),
                      );
                    },
                      child: Text("استماع", style: TextStyle(
                          fontSize: 20, color: Colors.blueAccent),)),
                ),
                SizedBox(width: 15,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AyahsSurah(
                                number: widget.data.number,
                                name: widget.data.name),
                          ),
                        );
                      },
                      child: Text("قراءه ", style: TextStyle(
                          fontSize: 20, color: Colors.blueAccent),)),
                ),

                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.data.name,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}