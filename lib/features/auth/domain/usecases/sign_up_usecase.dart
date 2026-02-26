import 'package:finos/features/auth/domain/entities/user_entity.dart';
import 'package:finos/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase(this.repository);

  Future<UserEntity?> call(String email, String password, String displayName) {
    return repository.signUp(email, password, displayName: displayName);
  }
}
