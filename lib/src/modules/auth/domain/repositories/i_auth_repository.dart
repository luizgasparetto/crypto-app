import 'package:core_module/core.dart';

import '../dtos/login_with_email_dto.dart';
import '../dtos/signup_with_email_dto.dart';

abstract class IAuthRepository {
  Future<Either<IError, bool>> loginWithEmail(LoginWithEmailDTO dto);
  Future<Either<IError, bool>> signUpWithEmail(SignUpWithEmailDTO dto);
  Future<Either<IError, bool>> googleSignIn();
}
