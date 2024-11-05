class OnboardingData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<OnboardingData> onboardingPages = [
  OnboardingData(
    title: "حافظ على التحفيز",
    description: "استلم تذكيرات يومية وآيات ملهمة تبقيك متصلاً بالقرآن.",
    imagePath: "assets/qu1.png",
  ),
  OnboardingData(
    title: "خطط مخصصة",
    description: "ضع أهدافك الخاصة وتلقَّ تذكيرات مخصصة لتبقى على المسار.",
    imagePath: "assets/qu2.png",
  ),
  OnboardingData(
    title: "مرحباً!",
    description: "ابدأ رحلتك في حفظ القرآن بسهولة وبالوتيرة التي تناسبك.",
    imagePath: "assets/qu3.png",
  ),
];
