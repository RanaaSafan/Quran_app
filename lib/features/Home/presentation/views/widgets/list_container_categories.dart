import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/features/Home/data/models/model_category/data_category.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/container_categories.dart';

class ListContainerCategories extends StatelessWidget {
  const ListContainerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DataCategory> logos=[
      DataCategory(icons:Icon(Icons.calendar_month,color: Colors.white,size: 30,), name: "التقويم"),
      DataCategory(icons:Icon(FlutterIslamicIcons.prayingPerson,color: Colors.white,size: 30), name: "الصلاه"),
      DataCategory(icons: Icon(Icons.book,color: Colors.white,size: 30,), name: "الحديث"),
      DataCategory(icons: Icon(FlutterIslamicIcons.quran2,color: Colors.white,size: 30), name: "القرآن"),
      DataCategory(icons:  Icon(FlutterIslamicIcons.tasbihHand,color: Colors.white,size: 30), name: "التسبيح"),

    ];
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
           itemCount: logos.length,
          itemBuilder: (Context, index) {
            return ContainerCategories(namelogo:logos[index].icons,name:logos[index].name );
          }),
    );
  }
}
