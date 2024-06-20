import 'package:prueba_dyshez/features/auth/data/datasources/auth_supabase_datasource.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/register_params.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/user.dart';
import 'package:prueba_dyshez/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupabseRepositoryImpl extends AuthRepository {
  AuthSupabseRepositoryImpl({
    AuthSupabaseDatasource? authSupabaseDatasource,
  }) : _authSupabaseDatasource = authSupabaseDatasource ??
            AuthSupabaseDatasource(Supabase.instance.client);

  final AuthSupabaseDatasource _authSupabaseDatasource;
  @override
  Future<UserEntity> getUser() async {
    final user = await _authSupabaseDatasource.getCurrentUser();
    if (user != null) {
      return UserEntity(username: user.id, email: user.email ?? '');
    } else {
      throw Exception('No se pudo obtener el usuario');
    }
  }

  @override
  Future<UserEntity> signUp(RegisterParams params) async {
    final user = await _authSupabaseDatasource.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    if (user != null) {
      return UserEntity(username: user.id, email: user.email ?? '');
    } else {
      throw Exception('No se pudo obtener el usuario');
    }
  }

  @override
  Future<UserEntity> login(String email, String password) async {
    final user = await _authSupabaseDatasource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (user != null) {
      return UserEntity(username: user.id, email: user.email ?? '');
    } else {
      throw Exception('No se pudo obtener el usuario');
    }
  }
}
