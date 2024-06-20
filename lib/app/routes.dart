import 'package:prueba_dyshez/features/pages.dart';

final routes = {
  LoginPage.path: (context) => const LoginPage(),
  OrderPage.path: (context) => const OrderPage(),
  SignupPage.path: (context) => const SignupPage(),
  VerifyOTPPage.path: (context) => const VerifyOTPPage(),
  ResetPasswordPage.path: (context) => const ResetPasswordPage(),
};

const initialRoute = LoginPage.path;
