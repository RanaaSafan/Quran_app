import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';

class ContainerCategories extends StatelessWidget {
  final Icon namelogo;
  final String name;

  const ContainerCategories(
      {super.key, required this.namelogo, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          switch(name){
            case "التقويم":
              GoRouter.of(context).push(Routers.DateCalender.name);
              break;
            case "الصلاه":
              GoRouter.of(context).push(Routers.ListContainerPrayer.name);
              break;
            case "الحديث":
              GoRouter.of(context).push(Routers.HadithScreen.name);
              break;
            case "القرآن":
              GoRouter.of(context).push(Routers.QuranScreen.name);
              break;
            case "التسبيح":
              GoRouter.of(context).push(Routers.ListTasbeehContainerCategories.name);
              break;

          }

        },
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min, // <-- Crucial change
            children: [
              Container(
                width: 85,
                height: 115,
                decoration: BoxDecoration(
                  color: const Color(0xFF522700),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(child: namelogo),
              ),
              const SizedBox(height: 8),
              SizedBox( // <-- Add SizedBox with constraints
                width: 85, // Match the width of the Container above
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFFA85000),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Center the text
                  overflow: TextOverflow.ellipsis, // Add ellipsis for long text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
