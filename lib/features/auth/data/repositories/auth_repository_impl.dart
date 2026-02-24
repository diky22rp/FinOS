import 'package:finos/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:finos/features/auth/data/models/user_model.dart';
import 'package:finos/features/auth/domain/entities/user_entity.dart';
import 'package:finos/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity?> signIn(String email, String password) async {
    final UserModel? userModel = await remoteDataSource.signIn(email, password);
    return userModel?.toEntity();
  }

  @override
  Future<UserEntity?> signUp(
    String email,
    String password, {
    String? displayName,
  }) async {
    final UserModel? userModel = await remoteDataSource.signUp(
      email,
      password,
      displayName: displayName,
    );
    return userModel?.toEntity();
  }

  @override
  Future<void> signOut() => remoteDataSource.signOut();

  @override
  Stream<UserEntity?> get user => remoteDataSource.user.map(
    (UserModel? userModel) => userModel?.toEntity(),
  );
}
