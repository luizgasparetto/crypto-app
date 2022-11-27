import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/domain/dtos/signup_with_email_dto.dart';

abstract class IAuthDatasource {
  Future<void> loginWithEmail(LoginWithEmailDTO dto);
  Future<void> signUpWithEmail(SignUpWithEmailDTO dto);
  Future<void> googleSignIn();
}
