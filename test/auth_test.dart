import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_provider.dart';
import 'package:mynotes/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group("Mock Authentication", () {
    final provider = MockAuthProvider();
    test("Shouldnot be initialized to begin with", () {
      expect(provider.isInitialized, false);
    });
    test("Cannot log out if not initialized", () {
      expect(
        provider.logOut(),
        throwsA(
          const TypeMatcher<NotInitializedException>(),
        ),
      );
    });

    test("Should be able to Initialized", () async {
      await provider.initialized();
      expect(provider.isInitialized, true);
    });
    test("user should be null after initilization", () {
      expect(provider.currentUser, null);
    });
    test(
      "should be able to initialized in less than 2 seconds",
      () async {
        await provider.initialized();
        expect(provider._isInitialized, true);
      },
      timeout: const Timeout(
        Duration(seconds: 3),
      ),
    );

    test("Create user should delegate to login function", () async {
      final badEmailUser = provider.createUser(
        email: "foo@bar.com",
        password: "anypassword",
      );
      expect(
        badEmailUser,
        throwsA(const TypeMatcher<UserNotFoundAuthException>()),
      );
      final badPassword = provider.createUser(
        email: "somefoo@bar.com",
        password: "foobar",
      );
      expect(
        badPassword,
        throwsA(const TypeMatcher<WrongPasswordAuthException>()),
      );
      final user = await provider.createUser(
        email: "email",
        password: "password",
      );
      expect(provider.currentUser, user);

      expect(user.isEmailVerified, false);
    });

    test("Login user should be verified", () {
      provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });

    test("should be able to login again", () async {
      await provider.logOut();
      await provider.login(
        email: "email",
        password: "password",
      );
      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;

  var _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 2));
    return login(email: email, password: password);
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialized() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
  }

  @override
  Future<void> logOut() async {
    if (!isInitialized) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();

    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    if (email == 'foo@bar.com') throw UserNotFoundAuthException();
    if (password == 'foobar') throw WrongPasswordAuthException();
    const user = AuthUser(isEmailVerified: false, email: "email@email.com", id: 'my-id');
    _user = user;

    return Future.value(user);
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialized) throw NotInitializedException();
    final user = _user;

    if (user == null) throw UserNotFoundAuthException();

    const newUser = AuthUser(isEmailVerified: true, email: 'email@email.com', id: 'my-id');

    _user = newUser;
  }
}
