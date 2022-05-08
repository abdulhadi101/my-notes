import 'package:bloc/bloc.dart';
import 'package:mynotes/services/auth/auth_provider.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider) : super(const AuthStateLoading()) {
    // Initialiazed Events
    on<AuthEventInitialized>(
      (event, emit) async {
        await provider.initialized();
        final user = provider.currentUser;
        if (user == null) {
          emit(
            const AuthStateLoggedOut(null),
          );
        } else if (!user.isEmailVerified) {
          emit(
            const AuthStateVerification(),
          );
        } else {
          emit(
            AuthStateLoggedIn(user),
          );
        }
      },
    );
    on<AuthEventLogIn>(
      (event, emit) async {
        final email = event.email;
        final password = event.password;
        try {
          final user = await provider.login(
            email: email,
            password: password,
          );
          emit(
            AuthStateLoggedIn(user),
          );
        } on Exception catch (e) {
          emit(
            AuthStateLoggedOut(e),
          );
        }
      },
    );
    on<AuthEventLogOut>(
      (event, emit) async {
        try {
          emit(
            const AuthStateLoading(),
          );
          await provider.logOut();
          emit(const AuthStateLoggedOut(null));
        } on Exception catch (e) {
          emit(
            AuthStateLogOutError(e),
          );
        }
      },
    );
  }
}
