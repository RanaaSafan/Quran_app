import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/home_image.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/list_container_categories.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/row_logo.dart';

import '../widgets/step_indiactor.dart';



class HomeScreenVersion2 extends StatelessWidget {
  const HomeScreenVersion2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HomeImage(),
          SizedBox(
            height: 10,
          ),
          StepIndicator(),
          RowLogo(),
          SizedBox(
            height: 10,
          ),
          ListContainerCategories(),
        ],
      ),
    );
  }
}
