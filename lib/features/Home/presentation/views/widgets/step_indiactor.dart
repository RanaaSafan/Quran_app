// import 'package:flutter/material.dart';
// import 'package:flutter_stepindicator/flutter_stepindicator.dart';
//
//
// class StepIndicator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     int currentStep = 3;
//     int totalSteps = 5;
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Directionality(
//         textDirection: TextDirection.ltr,
//         child: FlutterStepIndicator(
//           list: List.generate(totalSteps, (index) => 'خطوة ${index + 1}'), // Added labels
//           page: currentStep,
//           positiveColor: Color(0xFF522700),
//           negativeColor: Color(0xFF522700).withOpacity(0.5),
//          progressColor: Color(0xFF522700),
//           height: 20,
//           positiveCheck: Container( // Corrected positiveCheck
//             padding: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xFF522700),
//             ),
//             child: Icon(Icons.check, color: Colors.white, size: 12),
//           ),
//           onChange: (int newStep) {
//             // Handle step change here.  For example:
//             print('Step changed to: $newStep');
//           },
//         ),
//       ),
//     );
//   }
// }
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
                  width: 70, // Adjust spacing here
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
