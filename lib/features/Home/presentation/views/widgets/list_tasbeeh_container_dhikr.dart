import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/tasbeeh_conatiner_dhikr.dart';

class ListTasbeehContainerDhikr extends StatefulWidget {
  const ListTasbeehContainerDhikr({super.key});

  @override
  State<ListTasbeehContainerDhikr> createState() => _ListTasbeehContainerDhikrState();
}

class _ListTasbeehContainerDhikrState extends State<ListTasbeehContainerDhikr> {
  List<String> Data = [
    "سبحان الله ",
    "سبحان الله بحمده , سبحان ربي العظيم ",
    "الحمدالله ",
    "الله اكبر ",
    "استغفر الله العظبم ",
    "لا اله الا الله ",
    "لا حول ولا قوه الا بالله ",
    "اشهد ان محمد رسول الله ",
    "اصبحنا و اصبح الملك لله ",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:Data.length, // Number of prayer types
          itemBuilder:
          (BuildContext context, int index) {
        return TasbeehConatinerDhikr(data: Data[index],);
      }),
    );
  }
}
