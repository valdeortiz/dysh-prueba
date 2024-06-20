import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_dyshez/features/auth/data/repositories/auth_supabse_repository_impl.dart';
import 'package:prueba_dyshez/features/auth/domain/usecases/login_usecase.dart';
import 'package:prueba_dyshez/features/auth/presentation/bloc/login_bloc.dart';
import 'package:prueba_dyshez/features/auth/presentation/widgets/action_button_widget.dart';
import 'package:prueba_dyshez/features/auth/presentation/widgets/widgets.dart';

import 'package:prueba_dyshez/features/pages.dart';
import 'package:prueba_dyshez/features/utils/widgets/widgets.dart';
import 'package:prueba_dyshez/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(LoginUsecase(authRepository: AuthSupabseRepositoryImpl())),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  late AnimationController controller;

  late Animation<double> animation;

  final GlobalKey<FormState> _key = GlobalKey();

  String _email = '';

  String _contrasena = '';

  String mensaje = '';

  bool tiempo = false;
  final usernameCtrl = TextEditingController();
  final passCrl = TextEditingController();

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    if (kDebugMode) {
      // usernameCtrl.text = 'v@v.com';
      usernameCtrl.text = 'b@b.com';
      passCrl.text = '1234';
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    usernameCtrl.dispose();
    passCrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedLogo(animation: animation),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  l10n.login,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    // height: 20,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    .8, // 300.0, //size.width * .6,
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      _showError(context, state.message);
                    }
                    if (state is LoginSuccess) {
                      usernameCtrl.clear();
                      passCrl.clear();
                      // Navigator.of(context).pushNamed(OrderPage.path);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Bienvenido ${state.user.username}'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  builder: (BuildContext context, LoginState stateBuild) {
                    return Form(
                      key: _key,
                      child: Column(
                        children: <Widget>[
                          CustomTextField(
                            controller: usernameCtrl,
                            keyboard: TextInputType.text,
                            hint: '',
                            label: 'Username',
                            preIcon: const Icon(Icons.alternate_email_sharp),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Introduzca un username';
                              }
                              return null;
                            },
                            maxLength: 20,
                            onSave: (text) => _email = text ?? '',
                          ),
                          CustomPasswordTextField(
                            controller: passCrl,
                            hint: '',
                            label: 'Contraseña',
                            maxLength: 100,
                            onSave: (text) => _contrasena = text ?? '',
                          ),
                          if (stateBuild is LoginLoading)
                            const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            )
                          else
                            PrincipalButton(
                              titulo: 'Iniciar Sesión',
                              // color: Colors.black,
                              callback: () {
                                FocusManager.instance.primaryFocus?.unfocus();

                                if (_key.currentState!.validate()) {
                                  _key.currentState!.save();
                                  context.read<LoginBloc>().add(
                                        SendLoginEvent(
                                          email: _email,
                                          password: _contrasena,
                                        ),
                                      );
                                }
                              },
                            ),
                          ActionButtonWidget(
                            onTap: () => Navigator.of(context)
                                .pushNamed(SignupPage.path),
                            initialText: '¿No tienes cuenta? ',
                            finalText: 'Crea una  nueva cuenta',
                          ),
                          ActionButtonWidget(
                            onTap: () => Navigator.of(context)
                                .pushNamed(ResetPasswordPage.path),
                            initialText: '¿Olvidaste tu contraseña? ',
                            finalText: 'Recupera tu cuenta',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
