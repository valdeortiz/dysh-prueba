// import 'package:prueba_dyshez/features/auth/domain/entities/user.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupabaseDatasource {
  AuthSupabaseDatasource(this._supabaseClient);
  final SupabaseClient _supabaseClient;

  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await _supabaseClient.auth.signUp(
      email: email,
      password: password,
    );

    return response.user;
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await _supabaseClient.auth
        .signInWithPassword(password: password, email: email);

    return response.user;
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  Future<User?> getCurrentUser() async {
    return _supabaseClient.auth.currentUser;
  }
}
