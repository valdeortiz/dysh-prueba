import 'package:flutter/material.dart';
import 'package:prueba_dyshez/features/utils/widgets/base_page.dart';

class VerifyOTPPage extends StatelessWidget {
  const VerifyOTPPage({super.key});
  static const path = '/verify-otp';

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: 'Te hemos enviado un código de verificación',
      child: VerifyOTPView(),
    );
  }
}

class VerifyOTPView extends StatelessWidget {
  const VerifyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Form(
        child: Column(),
      ),
    );
  }
}
