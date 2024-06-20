import 'package:flutter/material.dart';
import 'package:prueba_dyshez/features/utils/widgets/base_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});
  static const path = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Reset Password', child: ResetPasswordView());
  }
}

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text('Reset Password')],
    );
  }
}
