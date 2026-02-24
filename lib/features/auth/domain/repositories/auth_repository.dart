import 'package:finos/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signIn(String email, String password);
  Future<UserEntity?> signUp(
    String email,
    String password, {
    String? displayName,
  });
  Future<void> signOut();
  Stream<UserEntity?> get user;
}
