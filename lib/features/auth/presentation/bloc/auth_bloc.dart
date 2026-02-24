import 'package:finos/features/auth/domain/entities/user_entity.dart';
import 'package:finos/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:finos/features/auth/domain/usecases/sign_in_usecase.dart'
    as usecases;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final usecases.SignUpUseCase signUpUseCase;

  AuthBloc(this.signInUseCase, this.signUpUseCase) : super(AuthInitial()) {
    on<AuthSignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signInUseCase(event.email, event.password);
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthError('Sign in failed'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signUpUseCase(
          event.email,
          event.password,
          event.displayName,
        );
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthError('Sign up failed'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
