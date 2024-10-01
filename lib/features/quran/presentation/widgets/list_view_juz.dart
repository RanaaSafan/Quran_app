import 'package:flutter/material.dart';

import 'container_surah.dart';
class ListViewJuz extends StatelessWidget {
  const ListViewJuz({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        separatorBuilder: (BuildContext context,int index)=>SizedBox(height: 6,),
        itemBuilder:(BuildContext context,int index){
          return ContainerSurah();
        }

    );
  }
}
