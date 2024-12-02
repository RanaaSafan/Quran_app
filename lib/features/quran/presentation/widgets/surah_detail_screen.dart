// import 'package:flutter/material.dart';
//
// import '../../data/models/model_surah_names/surah_datas.dart';
//
//
// class SurahDetailsScreen extends StatelessWidget {
//   final SurahDatas surahData;
//
//   const SurahDetailsScreen({Key? key, required this.surahData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(surahData.name),
//       ),
//       body: ListView.builder(
//         itemCount: surahData.numberOfAyahs,
//         itemBuilder: (context, index) {
//           final ayah = surahData.;
//           return ListTile(
//             leading: Text('${ayah.numberInSurah}'),
//             title: Text(ayah.text),
//           );
//         },
//       ),
//     );
//   }
// }
