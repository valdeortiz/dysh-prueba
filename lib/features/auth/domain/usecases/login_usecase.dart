import 'package:prueba_dyshez/features/auth/domain/entities/user.dart';
import 'package:prueba_dyshez/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  LoginUsecase({required this.authRepository});

  final AuthRepository authRepository;
  Future<UserEntity> call(String email, String password) async {
    return authRepository.login(email, password);
  }
}
