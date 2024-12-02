import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';


class RowLogo extends StatelessWidget {
  const RowLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image.asset( 'assets/ph_moon.png',width: 24,height: 24,),
              Image.asset( 'assets/tabler_haze-moon.png',width: 24,height: 24,),
              Image.asset( 'assets/mi_sunset.png',width: 24,height: 24,),
              Image.asset( 'assets/ph_sun.png',width: 24,height: 24,),
              Image.asset( 'assets/mynaui_sunrise.png',width: 24,height: 24,),
            ],
          ),
        ],
      ),
    );
  }
}
