import 'package:finos/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:finos/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:finos/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:finos/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc(
    this.signInUseCase,
    this.signUpUseCase,
    this.getCurrentUserUseCase,
    this.signOutUseCase,
  ) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        authCheckRequested: () async {
          emit(const AuthState.loading());
          try {
            final user = await getCurrentUserUseCase();
            if (user != null) {
              emit(AuthState.authenticated(user));
            } else {
              emit(const AuthState.unauthenticated());
            }
          } catch (err) {
            emit(AuthState.error(err.toString()));
          }
        },
        signedOut: () async {
          emit(const AuthState.loading());
          try {
            await signOutUseCase();
            emit(const AuthState.unauthenticated());
            emit(const AuthState.success('Signed out successfully'));
          } catch (err) {
            emit(AuthState.error(err.toString()));
          }
        },
        signInRequested: (email, password) async {
          emit(const AuthState.loading());
          try {
            final user = await signInUseCase(email, password);
            if (user != null) {
              emit(const AuthState.success('Sign in successful'));
              emit(AuthState.authenticated(user));
            } else {
              emit(const AuthState.error('Sign in failed'));
            }
          } catch (err) {
            emit(AuthState.error(err.toString()));
          }
        },
        signUpRequested: (email, password, displayName) async {
          emit(const AuthState.loading());
          try {
            final user = await signUpUseCase(email, password, displayName);
            if (user != null) {
              emit(const AuthState.success('Sign up successful'));
              emit(AuthState.authenticated(user));
            } else {
              emit(const AuthState.error('Sign up failed'));
            }
          } catch (err) {
            emit(AuthState.error(err.toString()));
          }
        },
      );
    });
  }
}
