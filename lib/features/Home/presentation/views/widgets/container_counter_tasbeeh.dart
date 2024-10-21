import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
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
          GoRouter.of(context).push(Routers.ListTasbeehContainerDhikr.name);
        },
        child: Container(
          width: double.infinity,
          height: 160,
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tasbeeh",style: TextStyle(fontSize: 30,color: Colors.white),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Counter",style: TextStyle(fontSize: 25,color: Colors.white),),
                    Spacer(),
                    Icon(
                      FlutterIslamicIcons.tasbihHand,
                      size: 50,
                      textDirection: TextDirection.rtl,
                      color: Colors.white.withOpacity(0.5),
                    )
                  ],
                ),

                Text("    Go to >",style: TextStyle(fontSize: 10,color: Colors.white70),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
