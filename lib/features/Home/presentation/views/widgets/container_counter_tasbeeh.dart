import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class ContainerCounterTasbeeh extends StatelessWidget {
  const ContainerCounterTasbeeh({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          GoRouter.of(context).pushNamed(Routers.TasbeehContainerDhikr.name);
        },
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xFF0A2060),
              borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Color(0xffFFFFFF),
                spreadRadius: 0.5,
                blurRadius: 2,
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Tasbeeh",style: TextStyle(fontSize: 25,color: Colors.white),),
              Text("Counter",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("Go to >",style: TextStyle(fontSize: 10,color: Colors.white70),),
            ],
          ),
        ),
      ),
    );
  }
}
