import 'package:flutter/material.dart';

import '../../../data/onboarding_data.dart';
import '../../widgets/onboarding_widget.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


  @override
  Widget build(BuildContext context) {
    return OnboardingWidget();
  }
}
