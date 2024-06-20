import 'package:flutter/material.dart';
import 'package:prueba_dyshez/features/utils/widgets/base_page.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  // Si ya se solicita email al crear una cuenta, Porque volver a solicitar ?

  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Verificar correo', child: VerifyEmailView());
  }
}

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Form(
        child: Column(),
      ),
    );
  }
}
