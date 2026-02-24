import 'package:finos/features/auth/domain/entities/user_entity.dart';
import 'package:finos/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInUseCase {
  final AuthRepository repository;
  SignInUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signIn(email, password);
  }
}

@lazySingleton
class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase(this.repository);

  Future<UserEntity?> call(String email, String password, String displayName) {
    return repository.signUp(email, password, displayName: displayName);
  }
}
