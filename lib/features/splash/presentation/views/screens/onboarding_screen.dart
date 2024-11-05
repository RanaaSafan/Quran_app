import 'package:flutter/material.dart';

import '../../../data/onboarding_data.dart';
import '../../widgets/onboarding_widget.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;


  void _nextPage() {
    if (_currentIndex < onboardingPages.length - 1) {
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemCount:onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingWidget(data: onboardingPages[index]);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingPages.length,
                  (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _nextPage,
            child: Text(_currentIndex == onboardingPages.length - 1 ? 'Get Started' : 'Next'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
