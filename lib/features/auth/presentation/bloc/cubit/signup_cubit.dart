import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/register_params.dart';
import 'package:prueba_dyshez/features/auth/domain/repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepository) : super(SignupInitial());
  final formKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordConfirmCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final AuthRepository _authRepository;

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(SignupLoading());
      try {
        await _authRepository.signUp(
          RegisterParams(
            nombre: nombreCtrl.text,
            username: usernameCtrl.text,
            email: emailCtrl.text,
            password: passwordCtrl.text,
            phone: phoneCtrl.text,
          ),
        );
        emit(SignupSuccess());
      } catch (e) {
        emit(SignupError(e.toString()));
      }
    }
  }
}
