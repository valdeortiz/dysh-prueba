import 'package:prueba_dyshez/features/auth/domain/entities/register_params.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> signUp(RegisterParams params);
  Future<UserEntity?> getUser();
}
