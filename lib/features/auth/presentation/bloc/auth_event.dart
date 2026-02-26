import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;
  const factory AuthEvent.signedOut() = _SignedOut;
  const factory AuthEvent.signInRequested(String email, String password) =
      _SignInRequested;
  const factory AuthEvent.signUpRequested(
    String email,
    String password,
    String displayName,
  ) = _SignUpRequested;
}
