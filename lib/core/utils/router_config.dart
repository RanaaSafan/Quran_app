
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/views/screens/authentication_ui.dart';
import '../../features/authentication/presentation/views/screens/forget_password_page.dart';
import '../../features/authentication/presentation/views/screens/login_page.dart';
import '../../features/authentication/presentation/views/screens/new_password_page.dart';
import '../../features/authentication/presentation/views/screens/otp_vertification_page.dart';
import '../../features/authentication/presentation/views/screens/password_change_page.dart';
import '../../features/authentication/presentation/views/screens/signUp_page.dart';
import 'app_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routers.authenticationpage.path,
    name: Routers.authenticationpage.name,
    pageBuilder: (context, state) {
      return const MaterialPage(child: AuthenticationUI());
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
  )
]);
