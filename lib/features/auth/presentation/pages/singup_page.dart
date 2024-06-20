import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_dyshez/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:prueba_dyshez/features/auth/presentation/bloc/cubit/signup_cubit.dart';
import 'package:prueba_dyshez/features/auth/presentation/widgets/action_button_widget.dart';
import 'package:prueba_dyshez/features/pages.dart';
import 'package:prueba_dyshez/features/utils/widgets/base_page.dart';
import 'package:prueba_dyshez/features/utils/widgets/widgets.dart';
import 'package:prueba_dyshez/l10n/l10n.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static const path = '/singup';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => SignupCubit(AuthRepositoryImpl()),
      child: BasePage(title: l10n.signup, child: const SignUpView()),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.select((SignupCubit cubit) => cubit);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: cubit.usernameCtrl,
            keyboard: TextInputType.text,
            hint: 'username',
            label: '',
            preIcon: const Icon(Icons.alternate_email_sharp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca un username';
              }
              return null;
            },
            maxLength: 20,
            onSave: (text) {},
          ),
          CustomTextField(
            controller: cubit.nombreCtrl,
            keyboard: TextInputType.text,
            hint: 'Nombre',
            label: '',
            preIcon: const Icon(Icons.person),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca un nombre';
              }
              return null;
            },
            maxLength: 20,
            onSave: (text) {},
          ),
          CustomTextField(
            controller: cubit.emailCtrl,
            keyboard: TextInputType.emailAddress,
            hint: 'Email',
            label: '',
            preIcon: const Icon(Icons.alternate_email_sharp),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca un email';
              }
              return null;
            },
            maxLength: 20,
            onSave: (value) {},
          ),
          CustomTextField(
            controller: cubit.phoneCtrl,
            keyboard: TextInputType.number,
            hint: 'Teléfono',
            label: '',
            preIcon: const Icon(Icons.phone),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca un teléfono';
              }
              return null;
            },
            maxLength: 20,
            onSave: (text) {},
          ),
          CustomPasswordTextField(
            controller: cubit.passwordCtrl,
            label: '',
            hint: 'Contraseña',
            maxLength: 100,
            onSave: (text) {},
          ),
          CustomPasswordTextField(
            controller: cubit.passwordConfirmCtrl,
            label: '',
            hint: 'Confirmar contraseña',
            validator: (p0) => p0 == cubit.passwordCtrl.text
                ? null
                : 'Las contraseñas no coinciden',
            maxLength: 100,
            onSave: (text) {},
          ),
          BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                // Navigator.pushNamed(context, VerifyOTPPage.path);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Usuario creado correctamente'),
                  ),
                );
              }
              if (state is SignupError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) => state is SignupLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : PrincipalButton(
                    titulo: 'Crear una cuenta',
                    color: Colors.black,
                    callback: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      context.read<SignupCubit>().signup();

                      // Navigator.pushNamed(context, VerifyOTPPage.path);
                    },
                  ),
          ),
          ActionButtonWidget(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(LoginPage.path),
            initialText: '¿Ya tienes cuenta? ',
            finalText: 'Inicia Sesión',
          ),
        ],
      ),
    );
  }
}
