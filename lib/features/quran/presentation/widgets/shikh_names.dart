import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/data/models/model_edition_surah/quran_edition.dart';
import 'package:quran_app/features/quran/presentation/widgets/tab_bar_juzSurah.dart';

class ShikhNames extends StatelessWidget {
  const ShikhNames({super.key, required this.data});

  final QuranEdition data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> TabBarJuzsurah(quran: data,)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFA85000),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.name,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
