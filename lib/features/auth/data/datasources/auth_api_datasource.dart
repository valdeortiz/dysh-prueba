import 'package:prueba_dyshez/features/auth/domain/entities/register_params.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/user.dart';

class AuthApiDatasource {
  const AuthApiDatasource();
  Future<UserEntity> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserEntity(username: 'as', email: 'va.@gmail.com');
  }

  Future<UserEntity> register(RegisterParams params) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserEntity(username: 'prueba', email: 'a@gmail.com');
  }
}
