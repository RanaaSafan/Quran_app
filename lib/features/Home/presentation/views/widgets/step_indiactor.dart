
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
     int currentStep=2;
     int totalSteps=5;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSteps, (index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (index > 0)
                Container(
                  width: 35, // Adjust spacing here
                  height: 2,
                  color: index <= currentStep ? Color(0xFF522700): Color(0xFFA85000),
                ),
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.symmetric(horizontal: 5), // Add margin for spacing
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index <= currentStep ? Color(0xFF522700) : Colors.white,
                  border: Border.all(
                    color:  Color(0xFF522700),
                  ),

                ),
                child: index <= currentStep
                    ? Icon(Icons.check, color: Colors.white, size: 20)
                    : null,
              ),
            ],
          );
        }),
      ),
    );
  }
}
