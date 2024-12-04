import 'package:flutter/material.dart';
import 'package:quran_app/features/more/presentation/widgets/categories_list.dart';

import '../../widgets/more_widget_categories.dart';

class MoreScreenCategories extends StatelessWidget {
  const MoreScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesGrid();
  }
}
