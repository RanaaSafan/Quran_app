import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/data/models/surah_datas.dart';
import '../../data/models/data.dart';
import 'auto_play_quran.dart';

class ContainerSurah extends StatelessWidget {
  const ContainerSurah({super.key, required this.data});
  final SurahDatas data; // Changed from List<Data> to List<Data>

  @override
  Widget build(BuildContext context) {
    final Data Audiodata;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        // onTap: (){
        //   showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //       title: Text('Playing Surah'),
        //       content: AutoPlayQuran(kUrl: Audiodata.ayahs[0].audio!),
        //     ),
        //   );
        // },
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xFF0A2060),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle, size: 20, color: Color(0xFF65D6FC)),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.name, // Safely access the first Data object's name
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
