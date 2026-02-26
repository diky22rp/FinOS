// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:finos/core/register_module.dart' as _i779;
import 'package:finos/features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i896;
import 'package:finos/features/auth/data/datasources/remote/auth_remote_datasource_impl.dart'
    as _i791;
import 'package:finos/features/auth/data/repositories/auth_repository_impl.dart'
    as _i238;
import 'package:finos/features/auth/domain/repositories/auth_repository.dart'
    as _i69;
import 'package:finos/features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i647;
import 'package:finos/features/auth/domain/usecases/sign_in_usecase.dart'
    as _i735;
import 'package:finos/features/auth/domain/usecases/sign_out_usecase.dart'
    as _i490;
import 'package:finos/features/auth/domain/usecases/sign_up_usecase.dart'
    as _i746;
import 'package:finos/features/auth/presentation/bloc/auth_bloc.dart' as _i184;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i896.AuthRemoteDataSource>(
      () => _i791.AuthRemoteDataSourceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i69.AuthRepository>(
      () => _i238.AuthRepositoryImpl(gh<_i896.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i647.GetCurrentUserUseCase>(
      () => _i647.GetCurrentUserUseCase(gh<_i69.AuthRepository>()),
    );
    gh.lazySingleton<_i735.SignInUseCase>(
      () => _i735.SignInUseCase(gh<_i69.AuthRepository>()),
    );
    gh.lazySingleton<_i490.SignOutUseCase>(
      () => _i490.SignOutUseCase(gh<_i69.AuthRepository>()),
    );
    gh.lazySingleton<_i746.SignUpUseCase>(
      () => _i746.SignUpUseCase(gh<_i69.AuthRepository>()),
    );
    gh.factory<_i184.AuthBloc>(
      () => _i184.AuthBloc(
        gh<_i735.SignInUseCase>(),
        gh<_i746.SignUpUseCase>(),
        gh<_i647.GetCurrentUserUseCase>(),
        gh<_i490.SignOutUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i779.RegisterModule {}
