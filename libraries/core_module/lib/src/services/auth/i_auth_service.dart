abstract class IAuthService {
  Future<void> loginWithEmail({required String email, required String password});
  Future<void> signUpWithEmail({required String email, required String password});

  Future<void> googleSignIn();

  bool get isUserLogged;
}
