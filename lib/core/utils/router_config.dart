
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/splash/presentation/views/screens/splash_screen.dart';
import '../../features/Hadith/presentation/views/screens/hadith_screen.dart';
import '../../features/Home/presentation/views/screens/main_screen.dart';
import '../../features/Home/presentation/views/widgets/date_calender.dart';
import '../../features/Home/presentation/views/widgets/list_container_prayer.dart';
import '../../features/Home/presentation/views/widgets/List_Tasbeeh_ContainerCategories.dart';
import '../../features/Home/presentation/views/widgets/tasbeeh_conatiner_dhikr.dart';
import '../../features/authentication/presentation/views/screens/forget_password_page.dart';
import '../../features/authentication/presentation/views/screens/login_page.dart';
import '../../features/authentication/presentation/views/screens/new_password_page.dart';
import '../../features/authentication/presentation/views/screens/otp_vertification_page.dart';
import '../../features/authentication/presentation/views/screens/password_change_page.dart';
import '../../features/authentication/presentation/views/screens/signUp_page.dart';
import '../../features/authentication/presentation/views/widgets/response_login.dart';
import '../../features/authentication/presentation/views/widgets/tab_bar_sign_login.dart';
import '../../features/quran/presentation/views/quran_screen.dart';
import '../../features/splash/presentation/views/screens/onboarding_screen.dart';
import 'app_router.dart';

final router = GoRouter(
    initialLocation: Routers.SplashScreen.path,
    //initialLocation: Routers.HomeScreen.path,
    routes: [
      GoRoute(
        path: Routers.SplashScreen.path,
        name: Routers.SplashScreen.name,
        pageBuilder: (context, state) {
          return  MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        path: Routers.OnboardingScreen.path,
        name: Routers.OnboardingScreen.name,
        pageBuilder: (context, state) {
          return  MaterialPage(child: OnboardingScreen());
        },
      ),

      GoRoute(
        path: Routers.loginpage.path,
        name: Routers.loginpage.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        path: Routers.MainScreen.path,
        name: Routers.MainScreen.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: MainScreen());
        },
      ),

      GoRoute(
        path: Routers.signuppage.path,
        name: Routers.signuppage.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupPage());
        },
      ),
      GoRoute(
        path: Routers.forgetpassword.path,
        name: Routers.forgetpassword.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ForgetPasswordPage());
        },
      ),
      GoRoute(
        path: Routers.newpassword.path,
        name: Routers.newpassword.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: NewPasswordPage());
        },
      ),
      GoRoute(
        path: Routers.otpverification.path,
        name: Routers.otpverification.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: OtpVertificationPage());
        },
      ),
      GoRoute(
        path: Routers.passwordchanges.path,
        name: Routers.passwordchanges.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: PasswordChangePage());
        },
      ),

      GoRoute(
        path: Routers.TasbeehContainerDhikr.path,
        name: Routers.TasbeehContainerDhikr.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: TasbeehConatinerDhikr(data: '',));
        },
      ),

      GoRoute(
        path: Routers.ListTasbeehContainerCategories.path,
        name: Routers.ListTasbeehContainerCategories.name,
        pageBuilder: (context, state) {
          return MaterialPage(child: ListTasbeehContainerCategories());
        },
      ),

  GoRoute(
    path: Routers.DateCalender.path,
    name: Routers.DateCalender.name,
    pageBuilder: (context, state) {
      return MaterialPage(child: DateCalender());
    },
  ),

      GoRoute(
        path: Routers.ListContainerPrayer.path,
        name: Routers.ListContainerPrayer.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ListContainerPrayer());
        },
      ),

      GoRoute(
        path: Routers.HadithScreen.path,
        name: Routers.HadithScreen.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: HadithScreen());
        },
      ),
      GoRoute(
        path: Routers.QuranScreen.path,
        name: Routers.QuranScreen.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: QuranScreen());
        },
      ),

      GoRoute(
        path: Routers.TabBarSignLogin.path,
        name: Routers.TabBarSignLogin.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: TabBarSignLogin());
        },
      ),
      GoRoute(
        path: Routers.ResponseLogin.path,
        name: Routers.ResponseLogin.name,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ResponseLogin());
        },
      ),


    ]);
