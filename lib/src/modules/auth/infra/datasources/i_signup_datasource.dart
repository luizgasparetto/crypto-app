import '../../domain/dtos/signup_with_email_dto.dart';

abstract class ISignUpDatasource {
  Future<void> signUpWithEmail(SignUpWithEmailDTO dto);
}
