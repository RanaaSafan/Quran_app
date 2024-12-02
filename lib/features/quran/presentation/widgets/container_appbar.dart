import 'package:flutter/material.dart';

// Extend PreferredSizeWidget
class ContainerAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ContainerAppbar({super.key});

  // Specify the preferred size for the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(170.0); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
surfaceTintColor:  Color(0xFFFFFFFF),
      expandedHeight: 170.0, // الارتفاع الكلي عند تمدد الـ SliverAppBar
      pinned: true, // لجعل الـ SliverAppBar يبقى مرئيًا في الأعلى عند التمرير
      backgroundColor: Color(0xFFFFFFFF), // خلفية اللون
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
            ),
            child: Image.asset('assets/sheikh.jpg',width: double.infinity,fit: BoxFit.cover,),

        ),

      ),
    );
  }
}
