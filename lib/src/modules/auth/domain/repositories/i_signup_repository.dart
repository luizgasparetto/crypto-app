import 'package:core_module/core.dart';
import 'package:crypto_app/src/modules/auth/domain/dtos/signup_with_email_dto.dart';

abstract class ISignUpRepository {
  Future<Either<IError, bool>> signUpWithEmail(SignUpWithEmailDTO dto);
}
