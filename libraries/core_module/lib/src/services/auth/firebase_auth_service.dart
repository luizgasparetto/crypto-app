import 'package:core_module/src/errors/i_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'i_auth_service.dart';

class FirebaseAuthService implements IAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleInstance = GoogleSignIn();

  @override
  Future<void> signUpWithEmail({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          throw AuthError(message: 'E-mail already in use');
        case 'invalid-email':
          throw AuthError(message: 'Invalid E-mail');
        case 'weak-password':
          throw AuthError(message: 'Weak Password');
        default:
          throw AuthError(message: 'SignUp With Email Error');
      }
    }
  }

  @override
  Future<void> loginWithEmail({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          throw AuthError(message: 'User not found');
        case 'wrong-password':
          throw AuthError(message: 'Wrong password');
        default:
          throw AuthError(message: 'Login With Email Error');
      }
    }
  }

  @override
  Future<void> googleSignIn() async {
    try {
      final googleUser = await _googleInstance.signIn();

      if (googleUser == null) return;

      final accountAuth = await googleUser.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: accountAuth.accessToken,
        idToken: accountAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-credential':
          throw AuthError(message: 'Invalid Credential');
        case 'user-disabled':
          throw AuthError(message: 'User Disabled');
        default:
          throw AuthError(message: 'Google Sign In Error');
      }
    }
  }

  @override
  bool get isUserLogged => _firebaseAuth.currentUser != null;
}
