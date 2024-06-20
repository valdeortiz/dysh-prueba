import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/user.dart';
import 'package:prueba_dyshez/features/auth/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SendLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await loginUseCase(event.email, event.password);
        emit(LoginSuccess(user));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
  final LoginUsecase loginUseCase;
}
