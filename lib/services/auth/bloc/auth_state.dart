import 'package:flutter/widgets.dart' show immutable;
import 'package:mynotes/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn(this.user);
}

class AuthStateLogginError extends AuthState {
  final Exception exception;

  const AuthStateLogginError(this.exception);
}

class AuthStateVerification extends AuthState {
  const AuthStateVerification();
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

class AuthStateLogOutError extends AuthState {
  final Exception exception;

  const AuthStateLogOutError(this.exception);
}