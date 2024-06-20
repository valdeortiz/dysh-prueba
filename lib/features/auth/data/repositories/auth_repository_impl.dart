import 'package:prueba_dyshez/features/auth/data/datasources/auth_api_datasource.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/register_params.dart';
import 'package:prueba_dyshez/features/auth/domain/entities/user.dart';
import 'package:prueba_dyshez/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({this.dataSource = const AuthApiDatasource()});

  final AuthApiDatasource dataSource;

  @override
  Future<UserEntity> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signUp(RegisterParams params) async {
    return dataSource.register(params);
  }

  @override
  Future<UserEntity> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
