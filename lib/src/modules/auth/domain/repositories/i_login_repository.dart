import 'package:core_module/core.dart';
import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';

abstract class ILoginRepository {
  Future<Either<IError, bool>> loginWithEmail(LoginWithEmailDTO dto);
}
