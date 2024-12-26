import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/authentication/presentation/views/widgets/tab_bar_sign_login.dart';
import '../../../../core/utils/app_router.dart';
import '../../data/onboarding_data.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      title: "حافظ على التحفيز",
      description: ".استلم تذكيرات يومية وآيات ملهمة تبقيك متصلاً بالقرآن ",
      imagePath: "assets/qu1.png",
    ),
    OnboardingData(
      title: "خطط مخصصة",
      description: ".ضع أهدافك الخاصة وتلقَّ تذكيرات مخصصة لتبقى على المسار",
      imagePath: "assets/qu2.png",
    ),
    OnboardingData(
      title: "مرحباً!",
      description: ".ابدأ رحلتك في حفظ القرآن بسهولة وبالوتيرة التي تناسبك ",
      imagePath: "assets/qu3.png",
    ),
  ];

  final PageController _controller = PageController();
  int _currentIndex = 0;
  bool _isButtonPressedSkip = false;
  bool _isButtonPressedNext = false;
  void _nextPage() {
    if (_currentIndex < onboardingPages.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      GoRouter.of(context)
          .push(Routers.TabBarSignLogin.name);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemCount: onboardingPages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    onboardingPages[index].imagePath,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Container(
                      width: 270,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.75),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            onboardingPages[index].title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isButtonPressedSkip = true;

                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarSignLogin()));
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromRGBO(119, 119, 119, 0.1),
                                    border: Border.all(
                                      color: _isButtonPressedSkip
                                          ? Color(0xffFFFFFF)
                                          : Color(0xffFFFFFF).withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "تخطي",
                                      style: TextStyle(
                                        color: _isButtonPressedSkip
                                            ? Color.fromRGBO(168, 80, 0, 1)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isButtonPressedNext = true;

                                  });
                                  _nextPage();
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:_isButtonPressedNext? Color(0xffFFFFFF):Color.fromRGBO(119, 119, 119, 0.1),
                                    border: Border.all(
                                      color: _isButtonPressedNext
                                          ? Color.fromRGBO(168, 80, 0, 1)
                                          : Color(0xffFFFFFF).withOpacity(0.5),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "متابعه",
                                      style: TextStyle(
                                        color: _isButtonPressedNext
                                            ? Color.fromRGBO(168, 80, 0, 1)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                    (index) => Container(
                  margin: EdgeInsets.only(right: 5),
                  width: _currentIndex == index ? 40 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _currentIndex == index
                        ? Color.fromRGBO(168, 80, 0, 1)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
