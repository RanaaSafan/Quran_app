class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routers {
  //static AppRouter authenticationpage = AppRouter(name: "/", path: "/");
  static AppRouter OnboardingScreen =
  AppRouter(name: "/OnboardingScreen", path: "/OnboardingScreen");
  static AppRouter SplashScreen =
  AppRouter(name: "/SplashScreen", path: "/SplashScreen");
  static AppRouter loginpage = AppRouter(name: "/login", path: "/login");
  static AppRouter signuppage = AppRouter(name: "/signip", path: "/signup");
  static AppRouter forgetpassword =
      AppRouter(name: "/forgetpassword", path: "/forgetpassword");
  static AppRouter newpassword =
      AppRouter(name: "/newpassword", path: "/newpassword");
  static AppRouter otpverification =
      AppRouter(name: "/otpverification", path: "/otpverification");
  static AppRouter passwordchanges =
      AppRouter(name: "/passwordchanges", path: "/passwordchanges");
  static AppRouter HomeScreen =
  AppRouter(name: "/HomeScreen", path: "/HomeScreen");

  static AppRouter ContainerCounterTasbeeh =
  AppRouter(name: "/ContainerCounterTasbeeh", path: "/ContainerCounterTasbeeh");


  static AppRouter TasbeehContainerDhikr =
  AppRouter(name: "/TasbeehContainerDhikr", path: "/TasbeehContainerDhikr");

  static AppRouter ListTasbeehContainerDhikr =
  AppRouter(name: "/ListTasbeehContainerDhikr", path: "/ListTasbeehContainerDhikr");

  static AppRouter BottomNavigationHome =
  AppRouter(name: "/BottomNavigationHome", path: "/BottomNavigationHome");



}
