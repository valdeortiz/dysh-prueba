part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupError extends SignupState {
  const SignupError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
